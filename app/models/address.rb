# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :country, :state, :city, :zipcode, :type, presence: true

  enum :type, { billing: 0, shipping: 1, home: 2, work: 3, other: 4 }
end
