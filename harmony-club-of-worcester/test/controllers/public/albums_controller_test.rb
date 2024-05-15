require "test_helper"

class Public::AlbumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_albums_index_url
    assert_response :success
  end

  test "should get show" do
    get public_albums_show_url
    assert_response :success
  end
end
