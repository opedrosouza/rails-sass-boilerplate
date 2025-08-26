# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    account
    plan
    status { "created" }
    price_in_cents { 10_00 }
  end
end
