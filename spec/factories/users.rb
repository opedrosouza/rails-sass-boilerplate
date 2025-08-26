# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    confirmed_at { Time.current }
    admin { false }

    trait :admin do
      admin { true }
    end

    trait :unconfirmed do
      confirmed_at { nil }
    end

    trait :confirmed_with_personal_account do
      confirmed_at { Time.current }

      after(:create) do |user|
        create(:account, owner: user, active: true)
      end
    end

    trait :confirmed_with_professional_account do
      confirmed_at { Time.current }

      after(:create) do |user|
        create(:account, :professional, owner: user, active: true)
      end
    end

    trait :without_account do
      confirmed_at { Time.current }
      after(:create) do |user|
        user.owned_accounts.destroy_all
      end
    end
  end
end
