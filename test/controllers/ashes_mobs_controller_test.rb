require "test_helper"

class AshesMobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ashes_mob = ashes_mobs(:one)
  end

  test "should get index" do
    get ashes_mobs_url
    assert_response :success
  end

  test "should get new" do
    get new_ashes_mob_url
    assert_response :success
  end

  test "should create ashes_mob" do
    assert_difference("AshesMob.count") do
      post ashes_mobs_url, params: { ashes_mob: { data: @ashes_mob.data, guid: @ashes_mob.guid } }
    end

    assert_redirected_to ashes_mob_url(AshesMob.last)
  end

  test "should show ashes_mob" do
    get ashes_mob_url(@ashes_mob)
    assert_response :success
  end

  test "should get edit" do
    get edit_ashes_mob_url(@ashes_mob)
    assert_response :success
  end

  test "should update ashes_mob" do
    patch ashes_mob_url(@ashes_mob), params: { ashes_mob: { data: @ashes_mob.data, guid: @ashes_mob.guid } }
    assert_redirected_to ashes_mob_url(@ashes_mob)
  end

  test "should destroy ashes_mob" do
    assert_difference("AshesMob.count", -1) do
      delete ashes_mob_url(@ashes_mob)
    end

    assert_redirected_to ashes_mobs_url
  end
end
