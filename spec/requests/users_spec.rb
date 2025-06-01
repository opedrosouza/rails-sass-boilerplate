require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /profile" do
    context "when user is authenticated" do
      before do
        sign_in(create(:user, :confirmed_with_personal_account), scope: :user)
        get profile_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the user profile template" do
        expect(response).to render_template("users/show")
      end
    end

    context "when user is not authenticated" do
      before do
        get profile_path
      end

      it "returns not found" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
