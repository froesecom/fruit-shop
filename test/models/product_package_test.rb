require 'test_helper'

class ProductPackageTest < ActiveSupport::TestCase
  # validations
  test "should have a product" do
    assert !ProductPackage.new(product_quantity: 1, value: 100).save   
  end

  test "should have a value" do
    assert !ProductPackage.new(product_quantity: 1, product: products(:watermelon)).save
  end

  test "should have a product_quantity" do
    assert !ProductPackage.new(value: 200, product: products(:rockmelon)).save
  end
  
  #class methods
  test "for_target should not include product_packages larger than target " do
    packages = ProductPackage.for_target(5)
    assert packages.select {|p| p.product_quantity > 5}.empty?
  end

  #associations
  test "should have belong_to product" do
    pp = ProductPackage.reflect_on_association(:product)
    assert pp.macro == :belongs_to
  end

  test "should have_many orders" do
    pp = ProductPackage.reflect_on_association(:orders)
    assert pp.macro == :has_many
  end

  test "should have_many order items" do
    pp = ProductPackage.reflect_on_association(:order_items)
    assert pp.macro == :has_many
  end

end
