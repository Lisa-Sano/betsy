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

  test "giving a price in dollars with a $ stores the price value of a product in cents" do
    product = Product.first
    product.to_cents("$50.00")
    assert_equal 5000, product.price
  end

  test "giving a price in dollars with no cents stores the price value of a product in cents" do
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

  test "avg_rating method returns an average integer of multiple reviews" do
    product = products(:shoes)
    review_two = reviews(:review_2)
    review_four = reviews(:review_4)
    assert_equal 3, product.avg_rating([review_two, review_four])
  end

  test "display_avg method returns a statement giving an average of multiple reviews" do
    product = products(:shoes)
    review_two = reviews(:review_2)
    review_four = reviews(:review_4)
    assert_equal "Average rating: 3", product.display_avg(product, [review_two, review_four])
  end

  test "add_categories adds specific categories to a product relationship" do
    product = products(:shoes)
    product_categories = product.categories
    shoes = categories(:shoes)

    product.add_categories([shoes.id])

    assert_equal "shoes", product.categories.first.name
  end

  test "add_categories removes specific categories that previously existed on product if selected again in the form" do
    product = products(:shoes)
    shoes = categories(:shoes)
    product.categories << shoes

    product.add_categories([shoes.id])

    assert_equal [], product.categories
  end
end
