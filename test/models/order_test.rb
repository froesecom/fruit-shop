require 'test_helper'

class OrderTest < ActiveSupport::TestCase
 
  def setup
    @empty_order = Order.new
    @empty_order.save
  end  

  #instance methods
  
  
  #validations
  test "should have a total" do
    assert !@empty_order.errors[:total].empty?
  end

  test "should have product requests" do
    assert !@empty_order.errors[:product_requests].empty?
  end
  
  test "should have order items" do
    assert !@empty_order.errors[:order_items].empty?
  end
  
  #associations
  test "should have have_many order items" do
    o = Order.reflect_on_association(:order_items)
    assert o.macro == :has_many
  end

  test "should have have_many product requests" do
    o = Order.reflect_on_association(:product_requests)
    assert o.macro == :has_many
  end

  test "should have have_many products" do
    o = Order.reflect_on_association(:products)
    assert o.macro == :has_many
  end

  test "should have have_many product packages" do
    o = Order.reflect_on_association(:product_packages)
    assert o.macro == :has_many
  end
end
