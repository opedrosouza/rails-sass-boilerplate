# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer

  attributes :id, :country, :state, :city, :neighborhood, :street, :number, :complement, :zipcode, :latitude, :longitude, :type

  belongs_to :addressable

end
