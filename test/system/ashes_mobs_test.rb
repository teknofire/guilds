require "application_system_test_case"

class AshesMobsTest < ApplicationSystemTestCase
  setup do
    @ashes_mob = ashes_mobs(:one)
  end

  test "visiting the index" do
    visit ashes_mobs_url
    assert_selector "h1", text: "Ashes mobs"
  end

  test "should create ashes mob" do
    visit ashes_mobs_url
    click_on "New ashes mob"

    fill_in "Data", with: @ashes_mob.data
    fill_in "Guid", with: @ashes_mob.guid
    click_on "Create Ashes mob"

    assert_text "Ashes mob was successfully created"
    click_on "Back"
  end

  test "should update Ashes mob" do
    visit ashes_mob_url(@ashes_mob)
    click_on "Edit this ashes mob", match: :first

    fill_in "Data", with: @ashes_mob.data
    fill_in "Guid", with: @ashes_mob.guid
    click_on "Update Ashes mob"

    assert_text "Ashes mob was successfully updated"
    click_on "Back"
  end

  test "should destroy Ashes mob" do
    visit ashes_mob_url(@ashes_mob)
    click_on "Destroy this ashes mob", match: :first

    assert_text "Ashes mob was successfully destroyed"
  end
end
