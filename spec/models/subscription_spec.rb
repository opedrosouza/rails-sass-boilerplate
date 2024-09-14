# == Schema Information
#
# Table name: subscriptions
#
#  id             :bigint           not null, primary key
#  price_in_cents :integer          not null
#  status         :string           default("created"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  account_id     :bigint           not null
#  plan_id        :bigint           not null
#
# Indexes
#
#  index_subscriptions_on_account_id  (account_id)
#  index_subscriptions_on_plan_id     (plan_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (plan_id => plans.id)
#
require "rails_helper"

RSpec.describe Subscription, type: :model do
  it "has a valid factory" do
    expect(build(:subscription, account: create(:account, :with_owner), plan: create(:plan))).to be_valid
  end

  describe "associations" do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to belong_to(:plan) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:price_in_cents) }
    it { is_expected.to validate_numericality_of(:price_in_cents).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_inclusion_of(:status).in_array(%w[created active past_due canceled]) }
  end
end
