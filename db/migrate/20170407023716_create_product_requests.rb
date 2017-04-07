class CreateProductRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :product_requests do |t|
      t.integer :order_id
      t.string :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
