require "test_helper"

class Auth::UserManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get auth_user_management_index_url
    assert_response :success
  end

  test "should get show" do
    get auth_user_management_show_url
    assert_response :success
  end
end
