# frozen_string_literal: true
# == Schema Information
#
# Table name: account_users
#
#  id            :bigint           not null, primary key
#  account_owner :boolean          default(FALSE), not null
#  current_role  :string           default("member"), not null
#  discarded_at  :datetime
#  roles         :jsonb            not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_account_users_on_account_id    (account_id)
#  index_account_users_on_discarded_at  (discarded_at)
#  index_account_users_on_roles         (roles) USING gin
#  index_account_users_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#
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
