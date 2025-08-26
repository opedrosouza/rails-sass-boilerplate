# frozen_string_literal: true

class Plan < ApplicationRecord
  has_many :subscriptions, dependent: :restrict_with_error
  validates :name, presence: true
  validates :price_in_cents, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def price
    Money.new(price_in_cents, "USD")
  end
end
