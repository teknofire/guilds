require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:one)
    sign_in_admin
  end

  test "should get index" do
    get players_url
    assert_response :success
  end

  test "should get new" do
    get new_player_url
    assert_response :success
  end

  test "should create player" do
    assert_difference("Player.count") do
      post players_url, params: { player: { guild_id: @player.guild_id, name: @player.name } }
    end

    assert_redirected_to player_url(Player.last)
  end

  test "should show player" do
    get player_url(@player)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_url(@player)
    assert_response :success
  end

  test "should update player" do
    patch player_url(@player), params: { player: { guild_id: @player.guild_id, name: @player.name } }
    assert_redirected_to player_url(@player)
  end

  test "should not destroy player with ledgers" do
    assert_difference("Player.count", 0) do
      delete player_url(@player)
    end
    assert_redirected_to players_url
  end

  test "should destroy player" do
    assert_difference("Player.count", -1) do
      delete player_url(players(:deleteable))
    end
    assert_redirected_to players_url
  end
end
