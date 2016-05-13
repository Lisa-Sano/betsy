require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    assert_not_nil assigns(:categories)
    assert_not_nil assigns(:merchants)
  end

  test "should get show page for specific product" do
    product = Product.first
    get :show, {id: product.id}
    assert_response :success
    assert_not_nil assigns(:product)
    assert_not_nil assigns(:order_item)
    assert_not_nil assigns(:reviews)
  end

end
