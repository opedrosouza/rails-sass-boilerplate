# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(FALSE), not null
#  personal   :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint           not null
#
# Indexes
#
#  index_accounts_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
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
