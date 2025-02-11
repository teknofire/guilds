require "application_system_test_case"

class LedgersTest < ApplicationSystemTestCase
  setup do
    @ledger = ledgers(:one)
  end

  test "visiting the index" do
    visit ledgers_url
    assert_selector "h1", text: "Ledgers"
  end

  test "should create ledger" do
    visit ledgers_url
    click_on "New ledger"

    fill_in "Action", with: @ledger.action
    fill_in "Item", with: @ledger.item_id
    fill_in "Modifier", with: @ledger.modifier
    fill_in "Player", with: @ledger.player_id
    fill_in "Points", with: @ledger.points
    fill_in "Qty", with: @ledger.qty
    fill_in "Rarity", with: @ledger.rarity_id
    click_on "Create Ledger"

    assert_text "Ledger was successfully created"
    click_on "Back"
  end

  test "should update Ledger" do
    visit ledger_url(@ledger)
    click_on "Edit this ledger", match: :first

    fill_in "Action", with: @ledger.action
    fill_in "Item", with: @ledger.item_id
    fill_in "Modifier", with: @ledger.modifier
    fill_in "Player", with: @ledger.player_id
    fill_in "Points", with: @ledger.points
    fill_in "Qty", with: @ledger.qty
    fill_in "Rarity", with: @ledger.rarity_id
    click_on "Update Ledger"

    assert_text "Ledger was successfully updated"
    click_on "Back"
  end

  test "should destroy Ledger" do
    visit ledger_url(@ledger)
    click_on "Destroy this ledger", match: :first

    assert_text "Ledger was successfully destroyed"
  end
end
