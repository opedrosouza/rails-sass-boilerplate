# frozen_string_literal: true

FactoryBot.define do
  factory :account_user do
    roles { {} }
    account_owner { true }
    user { nil }
    account { nil }

    trait :member do
      member { true }
    end

    trait :admin do
      admin { true }
    end

    trait :owner do
      account_owner { true }
    end

    trait :not_owner do
      account_owner { false }
    end

    trait :with_user_and_personal_account do
      before(:create) do |account_user|
        user = create(:user, :confirmed_with_personal_account)
        account_user.user = user
        account_user.account = user.owned_account
      end
    end
  end
end
