require_relative "../lib/player.rb"
require_relative "test_helper.rb"

class PlayerTest < MiniTest::Test

  def test_can_be_created_normally
    player = Player.new(player_number: 1)
    refute_nil(player)
  end

  def test_name_getter
    player = Player.new(player_number: 1)
    assert_nil(player.name)
  end

  def test_name_setter
    player = Player.new(player_number: 1)
    player.name = "Art"
    assert_equal("Art", player.name)
  end

  def test_choice_getter
    player = Player.new(player_number: 1)
    assert_nil(player.choice)
  end

  def test_choice_setter
    player = Player.new(player_number: 1)
    player.choice = 0
    assert_equal(0, player.choice)
  end

  def test_score_getter
    player = Player.new(player_number: 1)
    assert_equal(0, player.score)
  end

  def test_increase_score_accepts_valid
    player = Player.new(player_number: 1)
    player.increase_score(1)
    assert_equal(1, player.score)
  end

  def test_increase_score_rejects_invalid
    player = Player.new(player_number: 1)
    player.increase_score(2)
    assert_equal(0, player.score)
  end

  def test_increase_score_rejects_tie
    player = Player.new(player_number: 1)
    player.increase_score(0)
    assert_equal(0, player.score)
  end

  def test_reset_score
    player = Player.new(player_number: 1)
    player.increase_score(1)
    player.reset_score
    assert_equal(0, player.score)
  end

end
