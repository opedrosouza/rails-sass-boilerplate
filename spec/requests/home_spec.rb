# frozen_string_literal: true
require "rails_helper"

RSpec.describe "HomeController" do
  describe "GET /" do
    context "as an authenticated user" do
      let!(:user) { create(:user, :confirmed) }

      before do
        sign_in user
        get authenticated_root_path
      end

      it "returns success status" do
        expect(response).to have_http_status(:success)
      end

      it "renders the home page" do
        aggregate_failures do
          expect(response).to render_template(:index)
        end
      end
    end

    context "as an unauthenticated user" do
      before do
        get authenticated_root_path
      end

      it "renders the login page" do
        aggregate_failures do
          expect(response.body).to include("Entre em sua conta")
          expect(response).to render_template(:new)
        end
      end
    end
  end

end
