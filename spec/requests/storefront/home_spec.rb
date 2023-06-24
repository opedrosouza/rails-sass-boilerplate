# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Storefront::HomeController" do
  describe "GET /" do
    context "as an unauthenticated user" do
      before do
        get root_path
      end

      it "returns success status" do
        expect(response).to have_http_status(:success)
      end

      it "renders the home page" do
        aggregate_failures do
          expect(response.body).to include("Home")
          expect(response).to render_template(:storefront)
          expect(response).to render_template(:index)
        end
      end
    end
  end

end
