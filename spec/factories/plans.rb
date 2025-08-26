# frozen_string_literal: true

FactoryBot.define do
  factory :plan do
    price_in_cents { 1000 }
    name { "free" }
    description { "free plan" }
  end
end
