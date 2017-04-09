require 'test_helper'

class ProductPackageTest < ActiveSupport::TestCase

  test "should have a product" do
    assert !ProductPackage.new(product_quantity: 1, value: 100).save   
  end

  test "should have a value" do
    assert !ProductPackage.new(product_quantity: 1, product: products(:watermelon)).save
  end

  test "should have a product_quantity" do
    assert !ProductPackage.new(value: 200, product: products(:rockmelon)).save
  end

  test "for_target should not include product_packages larger than target " do
    packages = ProductPackage.for_target(5)
    assert packages.select {|p| p.product_quantity > 5}.empty?
  end

end
