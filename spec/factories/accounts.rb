# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    personal { true }
    active { false }
    owner { nil }

    trait :with_owner do
      owner { create(:user) }
    end

    trait :professional do
      personal { false }
    end

    trait :active do
      active { true }
    end
  end
end
