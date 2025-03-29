# frozen_string_literal: true

require "rails_helper"

RSpec.describe "App::HomeController" do
  describe "GET /" do
    context "when user is authenticated" do
      before do
        sign_in(create(:user, :confirmed_with_personal_account))
        get app_root_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not authenticated" do
      before do
        get app_root_path
      end

      it "redirects to sign in page" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
