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

  test "giving a price in dollars with a $ returns a price in cents" do
    product = Product.first
    product.to_cents("$50.00")
    assert_equal 5000, product.price
  end

  test "giving a price in dollars with no cents returns a price in cents" do
    product = Product.first
    product.to_cents("$50")
    assert_equal 5000, product.price
  end

  test "in_stock" do
    assert_equal false, products(:sandal).in_stock?
  end

  test "in_stock method" do
    assert_equal true, products(:jeans).in_stock?
  end
end
