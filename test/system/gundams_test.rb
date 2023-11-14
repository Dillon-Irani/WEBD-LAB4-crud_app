require "application_system_test_case"

class GundamsTest < ApplicationSystemTestCase
  setup do
    @gundam = gundams(:one)
  end

  test "visiting the index" do
    visit gundams_url
    assert_selector "h1", text: "Gundams"
  end

  test "should create gundam" do
    visit gundams_url
    click_on "New gundam"

    fill_in "Name", with: @gundam.name
    fill_in "Scale", with: @gundam.scale
    fill_in "Series", with: @gundam.series
    click_on "Create Gundam"

    assert_text "Gundam was successfully created"
    click_on "Back"
  end

  test "should update Gundam" do
    visit gundam_url(@gundam)
    click_on "Edit this gundam", match: :first

    fill_in "Name", with: @gundam.name
    fill_in "Scale", with: @gundam.scale
    fill_in "Series", with: @gundam.series
    click_on "Update Gundam"

    assert_text "Gundam was successfully updated"
    click_on "Back"
  end

  test "should destroy Gundam" do
    visit gundam_url(@gundam)
    click_on "Destroy this gundam", match: :first

    assert_text "Gundam was successfully destroyed"
  end
end
