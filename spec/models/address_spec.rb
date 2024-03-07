# frozen_string_literal: true
# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  addressable_type :string           not null
#  city             :string
#  complement       :string
#  country          :string
#  latitude         :string
#  longitude        :string
#  neighborhood     :string
#  number           :string
#  state            :string
#  street           :string
#  type             :integer
#  zipcode          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :bigint           not null
#
# Indexes
#
#  index_addresses_on_addressable  (addressable_type,addressable_id)
#
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
