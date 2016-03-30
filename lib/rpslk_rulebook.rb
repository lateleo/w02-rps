require_relative "player.rb"

class Rpslk_rulebook
  attr_reader :valid_moves, :error_message

  def initialize
    @valid_moves = ["rock", "paper", "scissors", "spock", "lizard"]
    @error_message = "Please respond with 'rock', 'paper', 'scissors', 'lizard', or 'Spock'."
  end

  # Generates a unique number for each possible combination of choices
  # from the two player objects, and then sets a variable equal to
  # that number mod 5. Then, takes the variable, and manipulates it,
  # such that values of 3 and 4 are converted to values of 1 and 2,
  # respectively, keeping values of 0, 1 and 2 the same, and then outputs
  # the result. If the round is a tie, the result is 0, if player1 wins,
  # the result is 1, and if player2 wins, the result is 2.
  def determine_outcome(player1_choice, player2_choice)
    first_output = (player1_choice - player2_choice + 5 * player1_choice * player2_choice) % 5
    first_output - (2 * ((first_output - (first_output % 3)) / 3))
  end

end
