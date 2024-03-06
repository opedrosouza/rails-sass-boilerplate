# frozen_string_literal: true

class ImproveUser < ActiveRecord::Migration[7.1]
  def change
    change_table :users, bulk: true do |t|
      t.remove :sudo, type: :boolean, default: false, null: false
      t.string :gender, null: false, default: "unspecified"
      t.string :phone_number
      t.date :birthdate
      t.boolean :accepted_terms, null: false, default: false
      t.datetime :accepted_terms_at
    end
  end
end
