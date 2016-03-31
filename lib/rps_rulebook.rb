require_relative "player.rb"

class RpsRulebook
  attr_reader :valid_moves, :error_message

  def initialize
    @valid_moves = ["Rock", "Paper", "Scissors"]
    @error_message = "Please respond with 'rock', 'paper', or 'scissors'."
  end

  # Generates a unique number for each possible combination of choices
  # from the two player objects, and then returns that number mod 3.
  # If the round is a tie, the number mod 3 is 0, if player1 wins,
  # the number mod 3 is 1, and if player2 wins, the number mod 3 is 2.
  def determine_outcome(player1_choice, player2_choice)
    (player1_choice - player2_choice + 3 * player1_choice * player2_choice) % 3
  end

  def explain_rules
    print ""
  end

end
