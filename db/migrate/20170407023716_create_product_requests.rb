class CreateProductRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :product_requests do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.boolean :can_fulfill

      t.timestamps
    end
  end
end
