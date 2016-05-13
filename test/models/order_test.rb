require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "validations: order_state cannot be nil" do
    order = Order.new
    assert_not order.valid?
  end

  test "validations: order_state must be a string, not an integer" do
    order = Order.new(order_state: 5)
    assert_not_kind_of(Integer, order.order_state)
  end

  test "validations: order_state must be a string" do
    order = Order.new(order_state: "string")
    assert_kind_of(String, order.order_state)
  end

  test "validations: user_id must be an integer, not a string" do
    order = Order.new(user_id: "frank")
    assert_not_kind_of(String, order.user_id)
  end

  test "validations: user_id must be an integer" do
    order = Order.new(user_id: 9237)
    assert_kind_of(Integer, order.user_id)
  end

  test "validations: total must be an integer, not a string" do
    order = Order.new(total: "twelve dollars")
    assert_not_kind_of(String, order.total)
  end

  test "validations: total must be an integer" do
    order = Order.new(total: 379474)
    assert_kind_of(Integer, order.total)
  end

  test "validations: name must be an string, not a integer" do
    order = Order.new(name: 5)
    assert_not_kind_of(Integer, order.name)
  end

  test "validations: name must be an string" do
    order = Order.new(name: "frank")
    assert_kind_of(String, order.name)
  end

  test "validations: email must be an string, not a integer" do
    order = Order.new(email: 737)
    assert_not_kind_of(Integer, order.email)
  end

  test "validations: email must be an string" do
    order = Order.new(email: "email")
    assert_kind_of(String, order.email)
  end

  test "validations: address must be an string, not a integer" do
    order = Order.new(address: 737)
    assert_not_kind_of(Integer, order.address)
  end

  test "validations: address must be an string" do
    order = Order.new(address: "123 street st.")
    assert_kind_of(String, order.address)
  end

  test "validations: city must be an string, not a integer" do
    order = Order.new(city: 737)
    assert_not_kind_of(Integer, order.city)
  end

  test "validations: city must be an string" do
    order = Order.new(city: "Spokane")
    assert_kind_of(String, order.city)
  end

  test "validations: state must be an string, not a integer" do
    order = Order.new(state: 737)
    assert_not_kind_of(Integer, order.state)
  end

  test "validations: state must be an string" do
    order = Order.new(state: "Washington")
    assert_kind_of(String, order.state)
  end

  test "validations: zip must be an integer, not a string" do
    order = Order.new(zip: "twelve dollars")
    assert_not_kind_of(String, order.zip)
  end

  test "validations: zip must be an integer" do
    order = Order.new(zip: 379474)
    assert_kind_of(Integer, order.zip)
  end

  test "validations: card_name must be an string, not a integer" do
    order = Order.new(card_name: 737)
    assert_not_kind_of(Integer, order.card_name)
  end

  test "validations: card_name must be an string" do
    order = Order.new(card_name: "Jacob Emerson Farley")
    assert_kind_of(String, order.card_name)
  end

  test "validations: last_four_cc must be an integer, not a string" do
    order = Order.new(last_four_cc: "twelve dollars")
    assert_not_kind_of(String, order.last_four_cc)
  end

  test "validations: last_four_cc must be an integer" do
    order = Order.new(last_four_cc: 379474)
    assert_kind_of(Integer, order.last_four_cc)
  end

  test "validations: cc_cvv must be an integer, not a string" do
    order = Order.new(cc_cvv: "twelve dollars")
    assert_not_kind_of(String, order.cc_cvv)
  end

  test "validations: cc_cvv must be an integer" do
    order = Order.new(cc_cvv: 379474)
    assert_kind_of(Integer, order.cc_cvv)
  end

  test "validations: billing_zip must be an integer, not a string" do
    order = Order.new(billing_zip: "twelve dollars")
    assert_not_kind_of(String, order.billing_zip)
  end

  test "validations: billing_zip must be an integer" do
    order = Order.new(billing_zip: 379474)
    assert_kind_of(Integer, order.billing_zip)
  end

  test "validations: cc_exp_month must be an string, not a integer" do
    order = Order.new(cc_exp_month: 737)
    assert_not_kind_of(Integer, order.cc_exp_month)
  end

  test "validations: cc_exp_month must be an string" do
    order = Order.new(cc_exp_month: "this is a string")
    assert_kind_of(String, order.cc_exp_month)
  end

  test "validations: cc_exp_year must be an string, not a integer" do
    order = Order.new(cc_exp_year: 737)
    assert_not_kind_of(Integer, order.cc_exp_year)
  end

  test "validations: cc_exp_year must be an string" do
    order = Order.new(cc_exp_year: "this is a string")
    assert_kind_of(String, order.cc_exp_year)
  end

  test "test method: already_ordered? - assert returns false if no OrderItem found" do
    order = orders(:one)
    product = products(:sweater)
    assert_not(order.already_ordered?(product, order))
  end

  test "test method: already_ordered? - assert returns item." do
    order = orders(:one)
    product = products(:sweater)
    order.add_product(product, 1, order.id)
    assert_kind_of(OrderItem, order.already_ordered?(product, order))
  end

  test "test method: add_product - assert order has a collection of order_items" do
    product = products(:sweater)
    order = orders(:one)
    order.add_product(product, 1, order.id)
    assert_not_empty(order.order_items)
  end

  test "test method: add_product - assert quantity updates" do
    product = products(:sweater)
    order = orders(:one)
    order.add_product(product, 1, order.id)
    order.add_product(product, 1, order.id)
    assert_equal(2, order.order_items.count)
  end

  test "test method: order_total - returns a sum of all the order_item prices in the order" do
    order = Order.create(order_state: "pending")
    order.order_items << order_items(:item1)
    order.order_items << order_items(:item2)

    assert_equal 37200, order.order_total
  end
end
