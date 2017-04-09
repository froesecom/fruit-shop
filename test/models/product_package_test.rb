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


end
