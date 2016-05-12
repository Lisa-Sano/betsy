require 'test_helper'

class Users::ProductsControllerTest < ActionController::TestCase

  test "should get index" do
    user = User.first
    get :index, {'user_id' => user.id}
    assert_response :success
    assert_not_nil assigns(:products)
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    user = User.first
    get :new, {'user_id' => user.id}, {'user_id' => user.id}
    assert_response :success
  end

  test "should get edit" do
    user = User.find_by_name('Person One')
    product = user.products.first
    get :edit, {'user_id' => user.id, 'id' => product.id}, {'user_id' => user.id}
    assert_response :success
  end
end
