require 'test_helper'

class OrderTest < ActiveSupport::TestCase
 
  def setup
    @empty_order = Order.new
    @empty_order.save
  end  

  test "should have a total" do
    assert !@empty_order.errors[:total].empty?
  end

  test "should have product requests" do
    assert !@empty_order.errors[:product_requests].empty?
  end
  
  test "should have order items" do
    assert !@empty_order.errors[:order_items].empty?
  end
end
