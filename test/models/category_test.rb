require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "validations: category name can't be blank" do
    category = Category.new

    assert_not category.valid?
    assert category.errors.keys.include?(:name), "name is not in the errors hash"
  end

  test "validations: category name must be unique" do
    category = Category.new(name: "sweater")
    
    assert_not category.valid?
    assert category.errors.keys.include?(:name), "name is not in the errors hash"
  end
end
