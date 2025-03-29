# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(FALSE), not null
#  personal   :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint           not null
#
# Indexes
#
#  index_accounts_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
require "rails_helper"

RSpec.describe Account do
  describe "factory" do
    it "has a valid factory" do
      expect(build(:account, owner: create(:user))).to be_valid
    end
  end

  describe "validations" do
    it { is_expected.to validate_inclusion_of(:personal).in_array([ true, false ]) }
    it { is_expected.to validate_inclusion_of(:active).in_array([ true, false ]) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:owner).class_name("User").inverse_of(:owned_accounts) }
    it { is_expected.to have_many(:account_users).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:account_users) }
    it { is_expected.to have_many(:subscriptions).dependent(:destroy) }
  end

  describe "callbacks" do
    describe "after_create" do
      describe "#create_account_user_for_owner" do
        let!(:account) { create(:account, owner: create(:user)) }

        it "creates an account user" do
          expect(account.account_users.count).to eq(1)
        end

        it "sets the account owner to true" do
          expect(account.account_users.first.account_owner).to be(true)
        end
      end
    end
  end

  describe "scopes" do
    let!(:user) { create(:user, :without_account) }
    let!(:personal_active_account) { create(:account, personal: true, active: true, owner: user) }
    let!(:professional_inactive_account) { create(:account, personal: false, active: false, owner: user) }

    describe ".personal" do
      it "returns only personal accounts" do
        expect(described_class.personal).to eq([ personal_active_account ])
      end
    end

    describe ".professional" do
      it "returns only professional accounts" do
        expect(described_class.professional).to eq([ professional_inactive_account ])
      end
    end

    describe ".active" do
      it "returns only active accounts" do
        expect(described_class.active).to eq([ personal_active_account ])
      end
    end

    describe ".inactive" do
      it "returns only inactive accounts" do
        expect(described_class.inactive).to eq([ professional_inactive_account ])
      end
    end
  end
end
