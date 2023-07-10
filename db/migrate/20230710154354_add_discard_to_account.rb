# frozen_string_literal: true
class AddDiscardToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :discarded_at, :datetime
    add_index :accounts, :discarded_at
  end
end
