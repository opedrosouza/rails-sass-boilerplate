# frozen_string_literal: true
# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  active       :boolean          default(FALSE), not null
#  discarded_at :datetime
#  personal     :boolean          default(TRUE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :bigint           not null
#
# Indexes
#
#  index_accounts_on_discarded_at  (discarded_at)
#  index_accounts_on_owner_id      (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
require "rails_helper"

RSpec.describe Account do
  describe "validations" do
    it { is_expected.to validate_inclusion_of(:personal).in_array([true, false]) }
    it { is_expected.to validate_inclusion_of(:active).in_array([true, false]) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:owner).class_name("User").inverse_of(:owned_account) }
  end

  describe "factory" do
    it "has a valid factory" do
      expect(build(:account, owner: create(:user, :confirmed))).to be_valid
    end
  end

  describe "callbacks" do
    describe "after_create" do
      describe "#set_owner_account_user" do
        let!(:account) { create(:account, owner: create(:user, :confirmed)) }

        it "creates an account user" do
          expect(account.account_users.count).to eq(1)
        end

        it "sets the account owner to true" do
          expect(account.account_users.first.account_owner).to be(true)
        end
      end
    end
  end
end
