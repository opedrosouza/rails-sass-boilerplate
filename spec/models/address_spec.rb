# frozen_string_literal: true

require "rails_helper"

RSpec.describe Address do
  it "has a valid factory" do
    expect(build(:address, :with_user)).to be_valid
  end

  describe "associations" do
    it { is_expected.to belong_to(:addressable) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:zipcode) }
    it { is_expected.to validate_presence_of(:type) }
  end
end
