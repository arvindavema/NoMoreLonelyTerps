require "application_system_test_case"

class HollasTest < ApplicationSystemTestCase
  setup do
    @holla = hollas(:one)
  end

  test "visiting the index" do
    visit hollas_url
    assert_selector "h1", text: "Hollas"
  end

  test "creating a Holla" do
    visit hollas_url
    click_on "New Holla"

    fill_in "User", with: @holla.user_id
    fill_in "Username", with: @holla.username
    click_on "Create Holla"

    assert_text "Holla was successfully created"
    click_on "Back"
  end

  test "updating a Holla" do
    visit hollas_url
    click_on "Edit", match: :first

    fill_in "User", with: @holla.user_id
    fill_in "Username", with: @holla.username
    click_on "Update Holla"

    assert_text "Holla was successfully updated"
    click_on "Back"
  end

  test "destroying a Holla" do
    visit hollas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Holla was successfully destroyed"
  end
end
