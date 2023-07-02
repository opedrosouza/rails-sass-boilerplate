# frozen_string_literal: true
class CreateAccountUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :account_users do |t|
      t.boolean :account_owner, default: false, null: false
      t.integer :role, default: 0, null: false
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
