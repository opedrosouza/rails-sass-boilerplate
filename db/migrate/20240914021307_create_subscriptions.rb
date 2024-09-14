class CreateSubscriptions < ActiveRecord::Migration[7.2]
  def change
    create_table :subscriptions do |t|
      t.references :account, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true
      t.string :status, null: false, default: "created"
      t.integer :price_in_cents, null: false

      t.timestamps
    end
  end
end
