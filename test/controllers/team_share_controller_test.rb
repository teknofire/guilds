require "test_helper"

class TeamShareControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get team_share_create_url
    assert_response :success
  end

  test "should get update" do
    get team_share_update_url
    assert_response :success
  end

  test "should get delete" do
    get team_share_delete_url
    assert_response :success
  end
end
