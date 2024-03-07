# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  addressable_type :string           not null
#  city             :string
#  complement       :string
#  country          :string
#  latitude         :string
#  longitude        :string
#  neighborhood     :string
#  number           :string
#  state            :string
#  street           :string
#  type             :integer
#  zipcode          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :bigint           not null
#
# Indexes
#
#  index_addresses_on_addressable  (addressable_type,addressable_id)
#
class Address < ApplicationRecord

  belongs_to :addressable, polymorphic: true

  validates :country, :state, :city, :zipcode, :type, presence: true

  enum type: { billing: 0, shipping: 1, home: 2, work: 3, other: 4 }

end
