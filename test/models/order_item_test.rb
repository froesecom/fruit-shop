require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
    
  def setup
    @empty_oi = OrderItem.new
    @empty_oi.save
  end
 
  #callbacks
  test "should call set total before validations" do
    oi = OrderItem.first
    oi.order = Order.new
    assert oi.total == nil
    oi.valid?
    assert oi.total > 0
  end

  #validations
  test "should have order" do
    assert !@empty_oi.errors[:order].empty?
  end

  test "should have product package" do
    assert !@empty_oi.errors[:product_package].empty?
  end

  test "should have total" do
    assert !@empty_oi.errors[:total].empty?
  end

  test "should have quantity" do
    assert !@empty_oi.errors[:quantity].empty?
  end

  #associations 
  test "should belong to order" do
    oi = OrderItem.reflect_on_association(:order)
    assert oi.macro == :belongs_to
  end

  test "should belong to product package" do
    oi = OrderItem.reflect_on_association(:product_package)
    assert oi.macro == :belongs_to
  end

end
