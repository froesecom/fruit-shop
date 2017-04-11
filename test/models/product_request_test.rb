require 'test_helper'

class ProductRequestTest < ActiveSupport::TestCase
 
  def setup
    @empty_pr = ProductRequest.new
    @empty_pr.save
  end

  #validations
  test "should have order" do
    assert !@empty_pr.errors[:order].empty?
  end
 
  test "should have product" do
    assert !@empty_pr.errors[:product].empty?
  end

  test "should have can_fulfill true" do
    assert !@empty_pr.errors[:can_fulfill].empty?
  end

  #associations
  test "should belong to order" do
    pp = ProductRequest.reflect_on_association(:order)
    assert pp.macro == :belongs_to
  end

  test "should belong to product" do
    pp = ProductRequest.reflect_on_association(:product)
    assert pp.macro == :belongs_to
  end

end
