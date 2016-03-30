require_relative "player.rb"
require_relative "rulebook.rb"

class Game

  attr_accessor :wins_needed, :player1, :player2, :rulebook

  def initialize
    @wins_needed = 0
    @player1 = nil
    @player2 = nil
    @rulebook = nil
  end

  # creates player ojects for both players, and assigns them to the appropriate
  # attribute for the game object.
  def setup
    puts "Welcome! Let's begin. Player 1, what is your name?"
    @player1 = Player.new(name: gets.chomp, player_number: 1)
    puts "And what is your name, Player 2?"
    @player2 = Player.new(name: gets.chomp, player_number: 2)
  end
  #------------------------------------------------------------------------
  # calls on both player objects to make their choice for the current round of play.
  def get_choices(rulebook)
    @player1.make_choice(rulebook.valid_moves)
    @player2.make_choice(rulebook.valid_moves)
  end

  # Declares the victor of the current round, based on the number
  # generated from determine_outcome.
  def declare_victor(victor_num)
    if victor_num == 0
      puts "Nobody wins! It's a tie! \n"
    else
      print "\n#{victor_num == 1 ? @player1.name : @player2.name} wins the round! "
    end
  end

  # Calls on both player objects to run their increase_score method,
  # which take the number generated from determine_outcome and checks
  # if it is the same as the player_number attribute, and if it matches,
  # increases the player's @score attribute by 1.
  def increase_scores(victor_num)
    @player1.increase_score(victor_num)
    @player2.increase_score(victor_num)
  end

  # Combines all the methods needed for a single round of gameplay.
  # requests the users for make a choice for each player object, runs
  # determine_outcome and saves the resulting value as victor_num, declares
  # a victor based on victor num, has both player objects check to see
  # if they should increase their scores and then doing so as necessary,
  # then returns the victor_num, which has a value of 0, 1, or 2, so that the
  # play_full_set method knows whether or not to call the announce_current_score
  # method.
  def play_single_round(rulebook)
    get_choices
    victor_num = rulebook.determine_outcome(@player1.choice, @player2.choice)
    declare_victor(victor_num)
    increase_scores(victor_num)
    victor_num
  end
  #----------------------------------------------------------------------

  # Used at the beginning of play_full_set to determine how many games are to be
  # played in the set. Doesn't continue until the user enters a positive,
  # odd intiger, which the method then converts to a float, divides in half,
  # and then rounds up to determine the number of rounds that need to be won
  # by a single player to win the set.
  def determine_number_of_wins
    until (response = gets.chomp.to_i) % 2 == 1 && response > 0
      puts "Please enter a positive, odd number."
    end
    (response.to_f / 2).ceil
  end

  # announces the current score of both players, used after every round that doesn't end in a tie.
  def announce_current_score
    print "After #{@player1.score + @player2.score} round(s), the scores are: "
    print "#{@player1.name}: #{@player1.score}, "
    puts "#{@player2.name}: #{@player2.score}"
    puts
  end

  # Tells both player objects to reset their scores to 0. used at the end
  # of play_full_set to ensure a fair starting point for the following set,
  # if the user(s) wishes to continue playing.
  def reset_scores
    @player1.reset_score
    @player2.reset_score
  end

  # Combines all the methods used for a full set of rounds. Asks the user
  # how many rounds are in the set, saves the number of requisite wins as
  # the wins_needed variable, and then repeatedly calls play_single_round,
  # as well as announce_current_score whenever a round isn't a tie, until
  # either player object's score is equal to wins_needed. Then, compares the
  # two player object's scores, and and anounces the winner of the set,
  # before having both player objects reset their scores to 0.
  def play_full_set(rulebook)
    puts "Best of how many games?"
    wins_needed = determine_number_of_wins
    until (@player1.score >= wins_needed) || (@player2.score >= wins_needed)
      announce_current_score if play_single_round(rulebook) != 0
    end
    puts "#{@player1.score > @player2.score ? @player1.name : @player2.name} wins the set! \n"
    reset_scores
  end
  #---------------------------------------------------------------------

  # stalls until user responds with either "yes" or "no".
  # Used by the continue? method to determine whether or not the user(s)
  # want to play again.
  def require_yes_no
    while !["yes", "no"].include?(response = gets.chomp.downcase)
      puts "Please respond with either 'yes' or 'no'."
    end
    response
  end

  # Returns true or false, based on if the user wants to play again.
  # Used by play_full_session to determine whether or not to call
  # play_full_set again.
  def continue?
    puts "Would you like to play again? (yes/no)"
    require_yes_no == "yes" ? true : false
  end

  # Combines all the methods used for an entire session of gameplay,
  # once the game and both player objects have been created.
  # Calls play_full_set at least once, and continues to do so until
  # the continue? method returns `false`, before thanking the user(s).
  def play_full_session(rulebook)
    keep_playing = true
    while keep_playing
      play_full_set(rulebook)
      keep_playing = continue?
    end
    puts "Thanks for playing!"
  end

end
