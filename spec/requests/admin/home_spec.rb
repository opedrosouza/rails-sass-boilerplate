# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Admin::HomeController" do
  describe "GET /" do
    context "when admin is not logged in" do
      before { get admin_root_path }

      it "redirects to the login page" do
        expect(response).to redirect_to(new_admin_session_path)
      end
    end

    context "when admin is logged in" do
      let(:admin) { create(:admin, :confirmed) }

      before do
        sign_in(admin)
        get admin_root_path
      end

      it "returns http 200 response" do
        expect(response).to have_http_status(:ok)
      end

      it "renders the admin home page" do
        expect(response).to render_template(:index)
      end
    end

    context "when non admin is logged in" do
      let(:user) { create(:user, :confirmed_with_personal_account) }

      before do
        sign_in(user)
        get admin_root_path
      end

      it "redirects to the admin login page" do
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end
end
