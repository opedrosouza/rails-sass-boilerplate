# frozen_string_literal: true
class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :neighborhood
      t.string :street
      t.string :number
      t.string :complement
      t.string :zipcode
      t.string :latitude
      t.string :longitude
      t.integer :type
      t.references :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
