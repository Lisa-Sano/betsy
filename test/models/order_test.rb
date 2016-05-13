require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #order_state - string
  #user_id - integer
  #total - integer

  test "validations: order_state cannot be nil" do
    order = Order.new

    assert_not order.valid?
  end

  test "validations: order_state must be a string, not an integer" do
    order = Order.new(order_state: 5)
    assert_not_kind_of(Integer, order)
  end

  test "validations: user_id must be an integer, not a string" do
    order = Order.new(user_id: "frank")
    assert_not_kind_of(String, order)
  end

  test "validations: total must be an integer, not a string" do
    order = Order.new(total: "twelve dollars")
    assert_not_kind_of(Integer, order)  
  end

end
