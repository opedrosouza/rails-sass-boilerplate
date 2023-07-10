# frozen_string_literal: true
class AddDiscardToAccountUser < ActiveRecord::Migration[7.0]
  def change
    add_column :account_users, :discarded_at, :datetime
    add_index :account_users, :discarded_at
  end
end
