# frozen_string_literal: true

# == Schema Information
#
# Table name: plans
#
#  id             :bigint           not null, primary key
#  description    :string
#  name           :string           not null
#  price_in_cents :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Plan < ApplicationRecord

  validates :name, presence: true
  validates :price_in_cents, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def price
    Money.new(price_in_cents, "USD")
  end

end
