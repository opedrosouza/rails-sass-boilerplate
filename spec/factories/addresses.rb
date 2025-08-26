# frozen_string_literal: true

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
