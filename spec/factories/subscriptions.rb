# == Schema Information
#
# Table name: subscriptions
#
#  id             :bigint           not null, primary key
#  price_in_cents :integer          not null
#  status         :string           default("created"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  account_id     :bigint           not null
#  plan_id        :bigint           not null
#
# Indexes
#
#  index_subscriptions_on_account_id  (account_id)
#  index_subscriptions_on_plan_id     (plan_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (plan_id => plans.id)
#
FactoryBot.define do
  factory :subscription do
    account
    plan
    status { "created" }
    price_in_cents { 10_00 }
  end
end
