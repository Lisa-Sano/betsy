require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  # test "should not get create" do
  # get :create
  # assert_redirected_to login_path if users(:crystal).save
  #
  # end

 test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: "melissa@melissa.com", name: "melissa", user_name: "supermeli", password: "davidpapacito" }
    end

    assert_redirected_to login_path
  end

end
