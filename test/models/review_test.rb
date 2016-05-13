require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  test "validations: review can be left blank" do
    review = Review.new(rating: 3)
    assert review.valid?
  end

  test "validations: user id must be an integer" do
    review = reviews(:review_2)
    assert Integer, review.rating
  end

  test "validations: review length cannot exceed 500 chars" do
    review = reviews(:review_3)
    assert_not review.valid?
  end

  # test "get_user_name" do
  #   review = reviews(:review_4)
  #   assert_equal review.get_user_name
  # end

  # where it is associated - returns user name, when it's not associated returns guest user

# assert(expression, fail_message)
# assert_not(expression, fail_message)
# assert_equal(expr1, expr2, fail_message)
# assert_includes(collection, object, fail_message)
# assert_not_nil(expression, fail_message)

end
