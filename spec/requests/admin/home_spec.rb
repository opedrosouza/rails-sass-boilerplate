# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Admin::HomeController" do
  describe "GET /admin" do
    context "when a sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed, :sudo)
        get admin_root_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end

    context "when a non-sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed_with_personal_account)
        get admin_root_path
      end

      it "redirects to the root path" do
        expect(response).to redirect_to(root_path)
      end

      it "displays a flash message" do
        expect(flash[:error]).to eq(I18n.t("pundit.not_authorized"))
      end
    end

    context "when a user is not authenticated" do
      before do
        get admin_root_path
      end

      it "redirects to the sign in page" do
        expect(response).to redirect_to(new_user_session_path)
      end

      it "displays a flash message" do
        expect(flash[:alert]).to eq(I18n.t("devise.failure.unauthenticated"))
      end
    end

  end
end
