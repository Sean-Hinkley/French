require "test_helper"

class Auth::SponsorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_sponsor = auth_sponsors(:one)
  end

  test "should get index" do
    get auth_sponsors_url
    assert_response :success
  end

  test "should get new" do
    get new_auth_sponsor_url
    assert_response :success
  end

  test "should create auth_sponsor" do
    assert_difference('Auth::Sponsor.count') do
      post auth_sponsors_url, params: { auth_sponsor: { beep: @auth_sponsor.beep } }
    end

    assert_redirected_to auth_sponsor_url(Auth::Sponsor.last)
  end

  test "should show auth_sponsor" do
    get auth_sponsor_url(@auth_sponsor)
    assert_response :success
  end

  test "should get edit" do
    get edit_auth_sponsor_url(@auth_sponsor)
    assert_response :success
  end

  test "should update auth_sponsor" do
    patch auth_sponsor_url(@auth_sponsor), params: { auth_sponsor: { beep: @auth_sponsor.beep } }
    assert_redirected_to auth_sponsor_url(@auth_sponsor)
  end

  test "should destroy auth_sponsor" do
    assert_difference('Auth::Sponsor.count', -1) do
      delete auth_sponsor_url(@auth_sponsor)
    end

    assert_redirected_to auth_sponsors_url
  end
end
