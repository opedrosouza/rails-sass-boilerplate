# frozen_string_literal: true
# == Schema Information
#
# Table name: account_users
#
#  id            :bigint           not null, primary key
#  account_owner :boolean          default(FALSE), not null
#  role          :integer          default("member"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_account_users_on_account_id  (account_id)
#  index_account_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :account_user do
    role { :admin }
    account_owner { true }
    user { nil }
    account { nil }

    trait :member do
      role { :member }
    end

    trait :admin do
      role { :admin }
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
