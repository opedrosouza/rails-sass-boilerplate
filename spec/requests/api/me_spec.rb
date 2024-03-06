require "rails_helper"

RSpec.describe "Api::MeController", type: :request do
  describe "GET /api/me" do
    let(:application) { create(:oauth_application) }
    let(:user) { create(:user, :confirmed) }
    let(:token) { create(:access_token, application:, resource_owner_id: user.id) }

    context "when the request is valid" do
      before { get api_me_path, headers: { "Authorization" => "Bearer #{token.token}" } }

      it "returns http success status" do
        expect(response).to have_http_status(:success)
      end

      it "returns the user's data" do
        expect(response.body).to include(user.email)
      end
    end

    context "when the request is invalid" do
      before { get api_me_path }

      it "returns http unauthorized status" do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
