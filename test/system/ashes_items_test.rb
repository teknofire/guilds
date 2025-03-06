require "application_system_test_case"

class AshesItemsTest < ApplicationSystemTestCase
  setup do
    @ashes_item = ashes_items(:one)
  end

  test "visiting the index" do
    visit ashes_items_url
    assert_selector "h1", text: "Ashes items"
  end

  test "should create ashes item" do
    visit ashes_items_url
    click_on "New ashes item"

    fill_in "Data", with: @ashes_item.data
    fill_in "Guid", with: @ashes_item.guid
    click_on "Create Ashes item"

    assert_text "Ashes item was successfully created"
    click_on "Back"
  end

  test "should update Ashes item" do
    visit ashes_item_url(@ashes_item)
    click_on "Edit this ashes item", match: :first

    fill_in "Data", with: @ashes_item.data
    fill_in "Guid", with: @ashes_item.guid
    click_on "Update Ashes item"

    assert_text "Ashes item was successfully updated"
    click_on "Back"
  end

  test "should destroy Ashes item" do
    visit ashes_item_url(@ashes_item)
    click_on "Destroy this ashes item", match: :first

    assert_text "Ashes item was successfully destroyed"
  end
end
