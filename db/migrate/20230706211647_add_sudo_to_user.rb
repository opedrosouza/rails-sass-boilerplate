# frozen_string_literal: true
class AddSudoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sudo, :boolean, default: false, null: false
  end
end
