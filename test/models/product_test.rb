require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  #validations
  test "should have a name" do
    assert !Product.new.save
  end

  #associations
  test "should have many orders" do
    p = Product.reflect_on_association(:orders)
    assert p.macro == :has_many
  end

  test "should have many product_requests" do
    p = Product.reflect_on_association(:product_requests)
    assert p.macro == :has_many
  end

  test "should have many product_packages" do
    p = Product.reflect_on_association(:product_packages)
    assert p.macro == :has_many
  end

end
