require "application_system_test_case"

class RentersTest < ApplicationSystemTestCase
  setup do
    @renter = renters(:one)
  end

  test "visiting the index" do
    visit renters_url
    assert_selector "h1", text: "Renters"
  end

  test "creating a Renter" do
    visit renters_url
    click_on "New Renter"

    fill_in "Car", with: @renter.car_id
    fill_in "Email", with: @renter.email
    fill_in "First name", with: @renter.first_name
    fill_in "Last name", with: @renter.last_name
    fill_in "Phone", with: @renter.phone
    click_on "Create Renter"

    assert_text "Renter was successfully created"
    click_on "Back"
  end

  test "updating a Renter" do
    visit renters_url
    click_on "Edit", match: :first

    fill_in "Car", with: @renter.car_id
    fill_in "Email", with: @renter.email
    fill_in "First name", with: @renter.first_name
    fill_in "Last name", with: @renter.last_name
    fill_in "Phone", with: @renter.phone
    click_on "Update Renter"

    assert_text "Renter was successfully updated"
    click_on "Back"
  end

  test "destroying a Renter" do
    visit renters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Renter was successfully destroyed"
  end
end
