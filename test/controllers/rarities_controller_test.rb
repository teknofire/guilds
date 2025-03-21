require "test_helper"

class RaritiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rarity = rarities(:one)
    sign_in_admin
  end

  test "should get index" do
    get rarities_url
    assert_response :success
  end

  test "should get new" do
    get new_rarity_url
    assert_response :success
  end

  test "should create rarity" do
    assert_difference("Rarity.count") do
      post rarities_url, params: { rarity: { modifier: @rarity.modifier, name: @rarity.name } }
    end

    assert_redirected_to rarity_url(Rarity.last)
  end

  test "should show rarity" do
    get rarity_url(@rarity)
    assert_response :success
  end

  test "should get edit" do
    get edit_rarity_url(@rarity)
    assert_response :success
  end

  test "should update rarity" do
    patch rarity_url(@rarity), params: { rarity: { modifier: @rarity.modifier, name: @rarity.name } }
    assert_redirected_to rarity_url(@rarity)
  end

  test "should destroy rarity" do
    @rarity = rarities(:deletable)
    assert_difference("Rarity.count", -1) do
      delete rarity_url(@rarity)
    end

    assert_redirected_to rarities_url
  end
end
