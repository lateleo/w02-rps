require_relative "../lib/game.rb"
require_relative "test_helper.rb"

class GameTest < MiniTest::Test

  def test_can_be_created_normally
    game = Game.new
    refute_nil(game)
  end

  def test_player1_getter
    game = Game.new
    assert_nil(game.player1)
  end

  def test_player1_setter
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    refute_nil(game.player1)
  end

  def test_declare_victor
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    assert_output("Nobody wins! It's a tie! \n") {game.declare_victor(0)}
    assert_output("\nArt wins the round! ") {game.declare_victor(1)}
    assert_output("\nBurtch wins the round! ") {game.declare_victor(2)}
  end

  def test_increase_scores
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.increase_scores(1)
    assert_equal(1, game.player1.score)
    assert_equal(0, game.player2.score)
    game.increase_scores(2)
    assert_equal(1, game.player2.score)
    assert_equal(1, game.player1.score)
    game.increase_scores(0)
    assert_equal(1, game.player2.score)
    assert_equal(1, game.player1.score)
  end

  def test_announce_current_score
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.increase_scores(1)
    assert_output("After 1 round(s), the scores are: Art: 1, Burtch: 0\n\n") {game.announce_current_score}
  end

  def test_reset_scores
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.increase_scores(1)
    game.increase_scores(2)
    game.reset_scores
    assert_equal(0, game.player1.score)
    assert_equal(0, game.player2.score)
  end
end
