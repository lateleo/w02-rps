require_relative "player.rb"

class RpslkRulebook
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

  def require_yes_no
    while !["yes", "no"].include?(response = gets.chomp.downcase)
      puts "Please respond with either 'yes' or 'no'."
    end
    response
  end

  def explain_rules
    puts "Not many people are familiar with Rock, Paper, Scissors, Lizard, Spock. Shall I explain the rules? (yes/no)"
    if require_yes_no == "yes"
      puts "     Rock, Paper, Scissors, Lizard, Spock (or RPSLK, for short), functions basically
      the same as the original, but each player has two additional options, for a total of 5
      options per player, and 25 possible combinations. The upside to RPSLK is that it's less
      likely to result in a tie, but the downside is that it's much more complicated! The two
      additional options, lizard and spock, have the following relationships:

      Lizard:
      - is crushed by rock (loses)
      - eats paper (wins)
      - is decapitated by scissors (loses)
      - poisons spock (wins)
      Spock:
      - vaporizes rock (wins)
      - is disproved by paper (loses)
      - destroys scissors (wins)

      It takes a while to learn, but you'll get the hang of it!
      "
    else
      print "Ah. Veterans, I see. "
    end
    print "Now, then. Let's begin. "
  end
end
