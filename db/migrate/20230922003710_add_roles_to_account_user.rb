# frozen_string_literal: true
class AddRolesToAccountUser < ActiveRecord::Migration[7.0]
  def change
    change_table :account_users, bulk: true do |t|
      t.jsonb :roles, null: false, default: {}
      t.index :roles, using: :gin
      t.string :current_role, default: "member", null: false
      t.remove :role, type: :integer
    end
  end
end
