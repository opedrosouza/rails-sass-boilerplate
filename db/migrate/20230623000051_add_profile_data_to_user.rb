# frozen_string_literal: true
class AddProfileDataToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.integer :role, null: false, default: 0
      t.integer :gender
      t.string :phone
    end

    add_index :users, :phone, unique: true
  end
end
