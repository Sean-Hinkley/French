require "test_helper"

class Web::ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_contact_index_url
    assert_response :success
  end
end
