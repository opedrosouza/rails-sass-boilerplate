# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Api::TokensController" do
  let(:oauth_application) { create(:oauth_application) }
  let(:user) { create(:user, :confirmed, password: "password") }
  let(:client_id) { oauth_application.uid }
  let(:client_secret) { oauth_application.secret }
  let(:grant_type) { "password" }
  let(:email) { user.email }
  let(:password) { "password" }

  let(:params) do
    {
      client_id:,
      client_secret:,
      grant_type:,
      email:,
      password:,
    }
  end

  before do
    user.owned_accounts.last.update!(active: true)
  end

  describe "POST /api/oauth/token" do
    context "when params are correct" do
      before { post oauth_token_path, params:, as: :json }

      it "returns http success status" do
        expect(response).to have_http_status(:success)
      end

      it "returns the access token in the body" do
        expect(response.body).to include("access_token")
      end

      it "creates a new access token" do
        expect { post oauth_token_path, params:, as: :json }.to change(Doorkeeper::AccessToken, :count).by(1)
      end

      it "update the user's sign in stats" do
        aggregate_failures do
          expect(user.reload.last_sign_in_at).to be_present
          expect(user.reload.current_sign_in_at).to be_present
          expect(user.reload.sign_in_count).to eq(1)
        end
      end
    end

    context "when params are incorrect" do
      let(:password) { "invalid" }

      before { post oauth_token_path, params:, as: :json }

      it "returns http bad_request status" do
        expect(response).to have_http_status(:bad_request)
      end

      it "doesnt create a new access token" do
        expect { post oauth_token_path, params:, as: :json }.not_to change(Doorkeeper::AccessToken, :count).from(0)
      end

      it "dont update the user's sign in stats" do
        aggregate_failures do
          expect(user.reload.last_sign_in_at).to be_nil
          expect(user.reload.current_sign_in_at).to be_nil
          expect(user.reload.sign_in_count).to eq(0)
        end
      end
    end
  end

end
