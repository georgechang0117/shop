class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :product
      t.integer :qty, default: 0
      t.decimal :price

      t.references :order

      t.timestamps
    end
  end
end
