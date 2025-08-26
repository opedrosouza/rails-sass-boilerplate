# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Admin::HomeController" do
  describe "GET /" do
    context "when admin is not logged in" do
      before { get admin_root_path }

      it "returns http 404 response" do
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when admin is logged in" do
      before do
        admin = create(:user, :admin)
        sign_in(admin, scope: :user)
        get admin_root_path
      end

      it "returns http 200 response" do
        expect(response).to have_http_status(:ok)
      end

      it "renders the admin home page" do
        expect(response).to render_template(:index)
      end
    end
  end
end
