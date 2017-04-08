class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_package_id
      t.integer :quantity
      t.integer :total

      t.timestamps
    end
  end
end
