# frozen_string_literal: true

require "rails_helper"

RSpec.describe Plan, type: :model do
  it "has a valid factory" do
    expect(build(:plan)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price_in_cents) }
    it { is_expected.to validate_numericality_of(:price_in_cents).is_greater_than_or_equal_to(0) }
  end

  describe "associations" do
    it { is_expected.to have_many(:subscriptions).dependent(:restrict_with_error) }
  end

  describe "#price" do
    it "returns a Money object" do
      plan = build(:plan, price_in_cents: 1000)
      expect(plan.price).to be_a(Money)
    end

    it "returns the price in cents as a Money object" do
      plan = build(:plan, price_in_cents: 1000)
      expect(plan.price.cents).to eq(1000)
    end

    it "returns the price in USD as a Money object" do
      plan = build(:plan, price_in_cents: 1000)
      expect(plan.price.currency.iso_code).to eq("USD")
    end
  end
end
