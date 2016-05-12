require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user passwords must match" do
    u = User.new(password: "dog", password_confirmation: "cat")
    assert_not u.valid?
    assert_includes u.errors.keys, :password_confirmation
  end

  test "can authenticate known users" do
    jeremy = users(:jeremy)
    assert_equal jeremy, User.log_in(jeremy.email, "password")
  end

  test "won't authenticate mismatched data" do
    assert_not User.log_in("x", "y")
  end

  test "won't authenticate a known user with a bad password" do
    jeremy = users(:jeremy)
    assert_not User.log_in(jeremy.email, "catdog")
  end

  test "total_revenue" do

    # def total_revenue
    #   OrderItem.where(product_id: products)
    #     .map { |item| item.product.price }
    #     .sum
    # end

    jeremy = users(:jeremy)
    assert_equal 29960, jeremy.total_revenue

  end

end
