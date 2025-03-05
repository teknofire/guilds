require "application_system_test_case"

class RaritiesTest < ApplicationSystemTestCase
  setup do
    @rarity = rarities(:one)
  end

  test "visiting the index" do
    visit rarities_url
    assert_selector "h1", text: "Rarities"
  end

  test "should create rarity" do
    visit rarities_url
    click_on "New rarity"

    fill_in "Modifier", with: @rarity.modifier
    fill_in "Name", with: @rarity.name
    click_on "Create Rarity"

    assert_text "Rarity was successfully created"
    click_on "Back"
  end

  test "should update Rarity" do
    visit rarity_url(@rarity)
    click_on "Edit this rarity", match: :first

    fill_in "Modifier", with: @rarity.modifier
    fill_in "Name", with: @rarity.name
    click_on "Update Rarity"

    assert_text "Rarity was successfully updated"
    click_on "Back"
  end

  test "should destroy Rarity" do
    visit rarity_url(@rarity)
    click_on "Destroy this rarity", match: :first

    assert_text "Rarity was successfully destroyed"
  end
end
