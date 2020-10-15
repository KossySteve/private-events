require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  fixtures :users
  test "sign up" do
    # login via https
    https!
    get "/signup"
    assert_response :success
  end
  test "login and browse site" do
    # login via https
    https!
    get "/login"
    assert_response :success
  end

  test "can get new user" do
    get new_user_path
    assert_response :success
  end
   
end
