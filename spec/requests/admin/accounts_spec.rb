# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Admin::Accounts", type: :request do
  describe "GET /admin/accounts" do
    context "when admin is logged in" do
      before do
        admin = create(:admin, :confirmed)
        sign_in(admin)
        get admin_accounts_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end

      it "displays the accounts" do
        expect(response.body).to include("Accounts")
      end
    end

    context "when admin is not logged in" do
      before { get admin_accounts_path }

      it "redirects to the login page" do
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

end
