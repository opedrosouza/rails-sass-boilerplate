# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  country          :string
#  state            :string
#  city             :string
#  neighborhood     :string
#  street           :string
#  number           :string
#  complement       :string
#  zipcode          :string
#  latitude         :string
#  longitude        :string
#  type             :integer
#  addressable_type :string           not null
#  addressable_id   :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_addresses_on_addressable  (addressable_type,addressable_id)
#

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :country, :state, :city, :zipcode, :type, presence: true

  enum :type, { billing: 0, shipping: 1, home: 2, work: 3, other: 4 }
end
