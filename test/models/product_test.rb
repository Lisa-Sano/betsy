require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "validations: product name can't be blank" do
    product = Product.new

    assert_not product.valid?
    assert product.errors.keys.include?(:name), "name is not in the errors hash"
  end

  test "validations: product name must be unique" do
    product = Product.new(name: "sweater")

    assert_not product.valid?
    assert product.errors.keys.include?(:name), "name is not in the errors hash"
  end

  test "validations: product price can't be blank" do
    product = Product.new

    assert_not product.valid?
    assert product.errors.keys.include?(:price), "price is not in the errors hash"
  end

  test "validations: product price must be an integer, not a string" do
    product = Product.new(price: 'price')

    assert_not product.valid?
    assert product.errors.keys.include?(:price), "price is not in the errors hash"
  end

  test "validations: ActiveRecord turns a number string into a number" do
    product = Product.new(price: '100')

    assert product.price, 100
  end

  test "validations: product price must be an integer, not a float" do
    product = Product.new(price: 100.5)

    assert_not product.valid?
    assert product.errors.keys.include?(:price), "price is not in the errors hash"
  end

  test "validations: product price must be greater than zero" do
    product = Product.new(price: 0)

    assert_not product.valid?
    assert product.errors.keys.include?(:price), "price is not in the errors hash"
  end

  test "validations: product must have a stock" do
    product = Product.new

    assert_not product.valid?
    assert product.errors.keys.include?(:stock), "stock is not in the errors hash"
  end

  test "validations: stock must be an integer, not a string" do
    product = Product.new(stock: 'stock')

    assert_not product.valid?
    assert product.errors.keys.include?(:stock), "stock is not in the errors hash"
  end

  test "validations: stock must be an integer, not a float" do
    product = Product.new(stock: 10.5)

    assert_not product.valid?
    assert product.errors.keys.include?(:stock), "stock is not in the errors hash"
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
