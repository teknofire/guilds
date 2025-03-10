require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
    @team = @member.team
    sign_in_admin
  end

  test "should get new" do
    get new_team_member_url(@team)
    assert_response :success
  end

  test "should create member" do
    assert_difference("Member.count") do
      post team_members_url(@team), params: { member: { user_id: @member.user_id } }
    end

    assert_redirected_to team_url(@team)
  end

  test "should get edit" do
    get edit_team_member_url(@team, @member)
    assert_response :success
  end

  test "should update member" do
    patch team_member_url(@team, @member), params: { member: { team_id: @member.team_id, user_id: @member.user_id } }
    assert_redirected_to team_url(@team)
  end

  test "should destroy member" do
    assert_difference("Member.count", -1) do
      delete team_member_url(@team, @member)
    end

    assert_redirected_to team_url(@team)
  end
end
