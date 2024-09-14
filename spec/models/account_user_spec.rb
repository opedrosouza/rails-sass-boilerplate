# frozen_string_literal: true
# == Schema Information
#
# Table name: account_users
#
#  id            :bigint           not null, primary key
#  account_owner :boolean          default(FALSE), not null
#  current_role  :string           default("member"), not null
#  roles         :jsonb            not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_account_users_on_account_id  (account_id)
#  index_account_users_on_roles       (roles) USING gin
#  index_account_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe AccountUser do
  describe "validations" do
    it { is_expected.to validate_inclusion_of(:account_owner).in_array([true, false]) }
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
