require "test_helper"

class AshesMobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ashes_mob = ashes_mobs(:one)
    sign_in_admin
  end

  test "should get index" do
    get ashes_mobs_url
    assert_response :success
  end

  test "should show ashes_mob" do
    get ashes_mob_url(@ashes_mob)
    assert_response :success
  end
end
