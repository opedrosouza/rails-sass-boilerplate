# frozen_string_literal: true

require "rails_helper"

RSpec.describe "HomeController" do
  describe "GET /" do
    context "when user is authenticated" do
      before do
        sign_in(create(:user, :confirmed_with_personal_account), scope: :user)
        get authenticated_root_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the authenticated root template" do
        expect(response).to render_template("home/index")
      end
    end

    context "when user is not authenticated" do
      before do
        get authenticated_root_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the unauthenticated root template" do
        expect(response).to render_template("pages/home")
      end
    end
  end
end
