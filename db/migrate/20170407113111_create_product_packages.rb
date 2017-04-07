class CreateProductPackages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_packages do |t|
      t.integer :product_id
      t.integer :product_quantity
      t.integer :value

      t.timestamps
    end
  end
end
