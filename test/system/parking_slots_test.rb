require "application_system_test_case"

class ParkingSlotsTest < ApplicationSystemTestCase
  setup do
    @parking_slot = parking_slots(:one)
  end

  test "visiting the index" do
    visit parking_slots_url
    assert_selector "h1", text: "Parking Slots"
  end

  test "creating a Parking slot" do
    visit parking_slots_url
    click_on "New Parking Slot"

    fill_in "Position", with: @parking_slot.position
    click_on "Create Parking slot"

    assert_text "Parking slot was successfully created"
    click_on "Back"
  end

  test "updating a Parking slot" do
    visit parking_slots_url
    click_on "Edit", match: :first

    fill_in "Position", with: @parking_slot.position
    click_on "Update Parking slot"

    assert_text "Parking slot was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking slot" do
    visit parking_slots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking slot was successfully destroyed"
  end
end
