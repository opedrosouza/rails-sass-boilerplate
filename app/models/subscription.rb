# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :account
  belongs_to :plan

  validates :price_in_cents, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[created active past_due canceled] }

  def price
    Money.new(price_in_cents, "USD")
  end
end
