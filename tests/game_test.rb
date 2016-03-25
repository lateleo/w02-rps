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

  def test_determine_outcome_rock_rock
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.player1.choice = 0
    game.player2.choice = 0
    assert_equal(0, game.determine_outcome)
  end

  def test_determine_outcome_rock_paper
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.player1.choice = 0
    game.player2.choice = 1
    assert_equal(2, game.determine_outcome)
  end

  def test_determine_outcome_rock_scissors
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.player1.choice = 0
    game.player2.choice = 2
    assert_equal(1, game.determine_outcome)
  end

  def test_determine_outcome_paper_rock
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.player1.choice = 1
    game.player2.choice = 0
    assert_equal(1, game.determine_outcome)
  end

  def test_determine_outcome_paper_paper
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.player1.choice = 1
    game.player2.choice = 1
    assert_equal(0, game.determine_outcome)
  end

  def test_determine_outcome_paper_scissors
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.player1.choice = 1
    game.player2.choice = 2
    assert_equal(2, game.determine_outcome)
  end

  def test_determine_outcome_scissors_rock
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.player1.choice = 2
    game.player2.choice = 0
    assert_equal(2, game.determine_outcome)
  end

  def test_determine_outcome_scissors_paper
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.player1.choice = 2
    game.player2.choice = 1
    assert_equal(1, game.determine_outcome)
  end

  def test_determine_outcome_scissors_scissors
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.player1.choice = 2
    game.player2.choice = 2
    assert_equal(0, game.determine_outcome)
  end

  def test_declare_victor_declares_ties
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.player1.choice = 0
    game.player2.choice = 0
    victor_num = game.determine_outcome
    assert_equal("Nobody wins! It's a tie! \n", game.declare_victor(victor_num))
  end

  def test_declare_victor_declares_player1
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.player1.choice = 0
    game.player2.choice = 2
    victor_num = game.determine_outcome
    assert_equal("\nArt wins the round! ", game.declare_victor(victor_num))
  end

  def test_declare_victor_declares_player2
    game = Game.new
    game.player1 = Player.new(name:"Art", player_number: 1)
    game.player2 = Player.new(name:"Burtch", player_number: 2)
    game.player1.choice = 0
    game.player2.choice = 1
    victor_num = game.determine_outcome
    assert_equal("\nBurtch wins the round! ", game.declare_victor(victor_num))
  end

end
