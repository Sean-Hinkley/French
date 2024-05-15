require "application_system_test_case"

class Auth::SponsorsTest < ApplicationSystemTestCase
  setup do
    @auth_sponsor = auth_sponsors(:one)
  end

  test "visiting the index" do
    visit auth_sponsors_url
    assert_selector "h1", text: "Auth/Sponsors"
  end

  test "creating a Sponsor" do
    visit auth_sponsors_url
    click_on "New Auth/Sponsor"

    fill_in "Beep", with: @auth_sponsor.beep
    click_on "Create Sponsor"

    assert_text "Sponsor was successfully created"
    click_on "Back"
  end

  test "updating a Sponsor" do
    visit auth_sponsors_url
    click_on "Edit", match: :first

    fill_in "Beep", with: @auth_sponsor.beep
    click_on "Update Sponsor"

    assert_text "Sponsor was successfully updated"
    click_on "Back"
  end

  test "destroying a Sponsor" do
    visit auth_sponsors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sponsor was successfully destroyed"
  end
end
