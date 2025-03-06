require "test_helper"

class AshesItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ashes_item = ashes_items(:one)
  end

  test "should get index" do
    get ashes_items_url
    assert_response :success
  end

  test "should get new" do
    get new_ashes_item_url
    assert_response :success
  end

  test "should create ashes_item" do
    assert_difference("AshesItem.count") do
      post ashes_items_url, params: { ashes_item: { data: @ashes_item.data, guid: @ashes_item.guid } }
    end

    assert_redirected_to ashes_item_url(AshesItem.last)
  end

  test "should show ashes_item" do
    get ashes_item_url(@ashes_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_ashes_item_url(@ashes_item)
    assert_response :success
  end

  test "should update ashes_item" do
    patch ashes_item_url(@ashes_item), params: { ashes_item: { data: @ashes_item.data, guid: @ashes_item.guid } }
    assert_redirected_to ashes_item_url(@ashes_item)
  end

  test "should destroy ashes_item" do
    assert_difference("AshesItem.count", -1) do
      delete ashes_item_url(@ashes_item)
    end

    assert_redirected_to ashes_items_url
  end
end
