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
FactoryBot.define do
  factory :plan do
    price_in_cents { 1000 }
    name { "free" }
    description { "free plan" }
  end
end
