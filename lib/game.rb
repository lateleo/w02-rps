require_relative "player.rb"

class Game

  attr_accessor :wins_needed, :player1, :player2

  def initialize
    @wins_needed
    @player1 = player1
    @player2 = player2
  end

  def setup #creates player ojects for both players and names them.
    puts "Welcome! Let's begin. Player 1, what is your name?"
    @player1 = Player.new(name: gets.chomp, player_number: 1)
    puts "And what is your name, Player 2?"
    @player2 = Player.new(name: gets.chomp, player_number: 2)
  end

  def get_choices #uses require_rps to assign choices to both players.
    @player1.make_choice
    @player2.make_choice
  end

  def determine_outcome # generates a unique number for each possible combination of 0, 1 and 2.
    (@player1.choice - @player2.choice + 3 * @player1.choice * @player2.choice) % 3
  end

  def declare_victor(victor_num)
    if victor_num == 0
      puts "Nobody wins! It's a tie! \n"
    else
      print "\n#{victor_num == 1 ? @player1.name : @player2.name} wins the round! "
    end
  end

  def increase_score(victor_num)
    @player1.increase_score(victor_num)
    @player2.increase_score(victor_num)
  end

  def play_single_round
    get_choices
    victor_num = determine_outcome
    declare_victor(victor_num)
    increase_score(victor_num)
    victor_num
  end
  #----------------------------------------------------------------------

  #stalls until the given number is odd, used for determining "best of" number,
  #then outputs the number of wins needed
  def determine_number_of_wins
    until (response = gets.chomp.to_i) % 2 == 1 && response > 0
      puts "Please enter an odd number."
    end
    (response.to_f / 2).ceil
  end

  #announces the current score, used after every round that doesn't end in a tie.
  def announce_current_score
    print "After #{@player1.score + @player2.score} rounds, the scores are: "
    print "#{@player1.name}: #{@player1.score}, "
    puts "#{@player2.name}: #{@player2.score}"
    puts
  end

  # asks for number of games in the set, and then plays until
  # one play has won enough rounds to win the set.
  def play_full_set
    puts "Best of how many games?"
    wins_needed = determine_number_of_wins
    until (@player1.score >= wins_needed) || (@player2.score >= wins_needed)
      announce_current_score if play_single_round != 0
    end
    puts "#{@player1.score > @player2.score ? @player1.name : @player2.name} wins the set! \n"
    reset_scores
  end
  #---------------------------------------------------------------------
  def reset_scores
    @player1.reset_score
    @player2.reset_score
  end

  def require_yes_no #stalls until user responds with either "yes" or "no"
    while !["yes", "no"].include?(response = gets.chomp.downcase)
      puts "Please respond with either 'yes' or 'no'."
    end
    response
  end

  def continue?
    puts "Would you like to play again? (yes/no)"
    require_yes_no == "yes" ? true : false
  end

  def play_full_session
    keep_playing = true
    while keep_playing
      play_full_set
      keep_playing = continue?
    end
    puts "Thanks for playing!"
  end
