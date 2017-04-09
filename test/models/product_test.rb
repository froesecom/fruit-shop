require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "should have a name" do
    assert !Product.new.save
  end

end
