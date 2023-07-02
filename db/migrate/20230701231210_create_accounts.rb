# frozen_string_literal: true
class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.boolean :personal, null: false, default: true
      t.boolean :active, null: false, default: false
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
