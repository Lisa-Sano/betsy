require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "validations: product name can't be blank" do
    product = Product.new

    not_valid_assertion(product, :name)
  end

  test "validations: product name must be unique" do
    product = Product.new(name: "sweater")
    not_valid_assertion(product, :name)
  end

  test "validations: product price can't be blank" do
    product = Product.new
    not_valid_assertion(product, :price)
  end

  test "validations: product price must be an integer, not a string" do
    product = Product.new(price: 'price')
    not_valid_assertion(product, :price)
  end

  test "validations: ActiveRecord turns a number string into a number" do
    product = Product.new(price: '100')

    assert product.price, 100
  end

  test "validations: product price must be an integer, not a float" do
    product = Product.new(price: 100.5)
    not_valid_assertion(product, :price)
  end

  test "validations: product price must be greater than zero" do
    product = Product.new(price: 0)
    not_valid_assertion(product, :price)
  end

  # test "validations: product must have a user_id" do
  #   product = Product.new
  #   not_valid_assertion(product, :user_id)
  # end

  # test "validations: user_id must be an integer, not a string" do
  #   product = Product.new(user_id: 'user_id')
  #   not_valid_assertion(product, :user_id)
  # end

  # test "validations: user_id must be an integer, not a float" do
  #   product = Product.new(user_id: 10.5)
  #   not_valid_assertion(product, :user_id)
  # end

  test "validations: product must have a stock" do
    product = Product.new
    not_valid_assertion(product, :stock)
  end

  test "validations: stock must be an integer, not a string" do
    product = Product.new(stock: 'stock')
    not_valid_assertion(product, :stock)
  end

  test "validations: stock must be an integer, not a float" do
    product = Product.new(stock: 10.5)
    not_valid_assertion(product, :stock)
  end

  def not_valid_assertion(object, attribute)
    assert_not object.valid?
    assert object.errors.keys.include?(attribute), "#{attribute} is not in the errors hash"
  end

  test "a product belongs to a user" do
    assert_equal users(:one), products(:sweater).user
  end

end
