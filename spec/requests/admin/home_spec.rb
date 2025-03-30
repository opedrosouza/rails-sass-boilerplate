# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Admin::HomeController" do
  describe "GET /" do
    context "when admin is not logged in" do
      before { get admin_root_path }

      it "returns http 200 response" do
        expect(response).to have_http_status(:ok)
      end

      it "renders the unauthenticated admin root template" do
        expect(response).to render_template("pages/home")
      end
    end

    context "when admin is logged in" do
      let(:admin) { create(:admin) }

      before do
        sign_in(admin, scope: :admin)
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
