# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  country          :string
#  state            :string
#  city             :string
#  neighborhood     :string
#  street           :string
#  number           :string
#  complement       :string
#  zipcode          :string
#  latitude         :string
#  longitude        :string
#  type             :integer
#  addressable_type :string           not null
#  addressable_id   :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_addresses_on_addressable  (addressable_type,addressable_id)
#

FactoryBot.define do
  factory :address do
    country { Faker::Address.country }
    state { Faker::Address.state }
    city { Faker::Address.city }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    zipcode { Faker::Address.zip_code }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    type { %w[billing shipping home work other].sample }
    addressable { nil }
  end

  trait :with_user do
    addressable { create(:user) }
  end
end
