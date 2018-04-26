require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { address_id: @user.address_id, contact_id: @user.contact_id, deleted_at: @user.deleted_at, first_name: @user.first_name, is_active: @user.is_active, last_name: @user.last_name, role_id: @user.role_id, salutation: @user.salutation, tenant_id: @user.tenant_id, user_key: @user.user_key, user_name: @user.user_name } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address_id: @user.address_id, contact_id: @user.contact_id, deleted_at: @user.deleted_at, first_name: @user.first_name, is_active: @user.is_active, last_name: @user.last_name, role_id: @user.role_id, salutation: @user.salutation, tenant_id: @user.tenant_id, user_key: @user.user_key, user_name: @user.user_name } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json
    end

    assert_response 204
  end
end
