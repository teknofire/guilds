require "test_helper"

class AshesItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ashes_item = ashes_items(:one)
    sign_in_admin
  end

  test "should get index" do
    get ashes_items_url
    assert_response :success
  end

  test "should show ashes_item" do
    get ashes_item_url(@ashes_item)
    assert_response :success
  end
end
