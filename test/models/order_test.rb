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

    not_valid_assertion(order, :order_state)
  end

  test "validations: order_state must be a string, not an integer" do
    order = Order.new(order_state: 5)
    not_valid_assertion(order, :order_state)
  end

  test "validations: user_id must be an integer, not a string" do
    order = Order.new(user_id: "frank")
    not_valid_assertion(order, :user_id)
  end

  test "validations: total must be an integer, not a string" do
    order = Order.new(total: "twelve dollars")
    not_valid_assertion(order, :total)
  end
end
