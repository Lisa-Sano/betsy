require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  test "subtotal" do
    assert_equal 28000, order_items(:item2).subtotal
  end

end
