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
class AddressSerializer < ActiveModel::Serializer

  attributes :id, :country, :state, :city, :neighborhood, :street, :number, :complement, :zipcode, :latitude, :longitude, :type

  belongs_to :addressable

end
