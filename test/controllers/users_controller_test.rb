require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

 test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: "melissa@melissa.com", name: "melissa", user_name: "supermeli", password: "davidpapacito" }
    end

    assert_redirected_to login_path
  end

  test "should not create user" do
    post :create, user: { email: "catalina@catalina.com", user_name: "supermeli", password: "davidpapacito" }
    assert_template :new
  end

  test "should get edit" do
    session[:user_id] = User.first.id
    get :edit, id: session[:user_id]
    assert_response :success
  end

  test "should update" do
    session[:user_id] = User.first.id
    patch :update, id: session[:user_id], user: { email: "catalina@catalina.com", user_name: "supermeli", password: "davidpapacito" }
    assert_redirected_to user_path(session[:user_id])
  end

end
