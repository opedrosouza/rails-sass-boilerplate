# frozen_string_literal: true

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
class Subscription < ApplicationRecord
  belongs_to :account
  belongs_to :plan

  validates :price_in_cents, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[created active past_due canceled] }

  def price
    Money.new(price_in_cents, "USD")
  end
end
