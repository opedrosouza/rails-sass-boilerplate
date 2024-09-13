# frozen_string_literal: true
class CreatePlans < ActiveRecord::Migration[7.2]
  def change
    create_table :plans do |t|
      t.integer :price_in_cents, null: false, default: 0
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
  end
end
