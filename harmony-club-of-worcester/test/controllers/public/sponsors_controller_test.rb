require "test_helper"

class Public::SponsorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_sponsors_index_url
    assert_response :success
  end

  test "should get show" do
    get public_sponsors_show_url
    assert_response :success
  end
end
