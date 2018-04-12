class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :state
      t.string :sitter_sku
      t.monetize :amount
      t.jsonb :payment
      t.references :user, foreign_key: true
      t.monetize :amount, currency: { present: false }

      t.timestamps
    end
  end
end
