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
