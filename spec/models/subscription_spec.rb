# frozen_string_literal: true

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
