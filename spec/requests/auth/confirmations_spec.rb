# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Auth::ConfirmationsController" do
  describe "GET /auth/confirmation?confirmation_token=abcdef" do
    let(:user) { create(:user, :unconfirmed) }

    before { get "/auth/confirmation?confirmation_token=#{user.confirmation_token}" }

    it "confirms the user" do
      expect(user.reload.confirmed?).to be true
    end

    it "signs in the user" do
      expect(response).to redirect_to(root_path)
      expect(controller.current_user).to eq(user)
    end

    it "activates the account" do
      expect(user.owned_accounts.last.reload.active?).to be true
    end
  end
end
