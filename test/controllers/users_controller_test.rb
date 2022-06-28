require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get api_v1_users_url
    assert_response :success
  end

  test "should show user" do
    get api_v1_user_url(@user)
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post api_v1_users_url, params: { user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, username: @user.username, gender: @user.gender, date_of_birth: @user.date_of_birth, phone: @user.phone } }
    end

    assert_response :success
  end

  test "should update user" do
    patch api_v1_user_url(@user), params: { user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, username: @user.username, gender: @user.gender, date_of_birth: @user.date_of_birth, phone: @user.phone } }
    assert_response :success
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete api_v1_user_url(@user)
    end

    assert_response :success
  end
end
