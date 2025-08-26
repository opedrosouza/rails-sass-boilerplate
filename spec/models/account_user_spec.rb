# frozen_string_literal: true

require "rails_helper"

RSpec.describe AccountUser do
  describe "validations" do
    it { is_expected.to validate_inclusion_of(:account_owner).in_array([ true, false ]) }
    it { is_expected.to validate_presence_of(:roles) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user).inverse_of(:account_users) }
    it { is_expected.to belong_to(:account).inverse_of(:account_users) }
  end

  describe "delegations" do
    it { is_expected.to delegate_method(:email).to(:user) }
  end

  describe "admin?" do
    let!(:user) { create(:user, :confirmed_with_personal_account) }

    it "returns true if the user has the admin role" do
      account_user = create(:account_user, :admin, user:, account: user.owned_accounts.last)
      expect(account_user).to be_admin
    end

    it "returns false if the user does not have the admin role" do
      account_user = create(:account_user, :member, user:, account: user.owned_accounts.last)
      expect(account_user).not_to be_admin
    end
  end

  describe "member?" do
    let!(:user) { create(:user, :confirmed_with_personal_account) }

    it "returns true if the user has the member role" do
      account_user = create(:account_user, :member, user:, account: user.owned_accounts.last)
      expect(account_user).to be_member
    end

    it "returns false if the user does not have the member role" do
      account_user = create(:account_user, :admin, user:, account: user.owned_accounts.last)
      expect(account_user).not_to be_member
    end
  end
end
