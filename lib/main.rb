require "pry"
require_relative "player.rb"

def setup(player1, player2) #creates player ojects for both players and names them.
  puts "Welcome! Let's begin. Player 1, what is your name?"
  player1.name = gets.chomp
  puts "And what is your name, Player 2?"
  player2.name = gets.chomp
end
#---------------------------------------------------------------------
def get_choices(player1, player2) #uses require_rps to assign choices to both players.
  player1.make_choice
  player2.make_choice
end

def equation(a, b) # generates a unique number for each possible combination of 0, 1 and 2.
  (a - b + 3*a*b) % 3
end

def increase_score(victor_num, player1, player2)
  player1.increase_score(victor_num)
  player2.increase_score(victor_num)
end

def declare_victor(victor_num, player1, player2)
  if victor_num == 0
    puts "Nobody wins! It's a tie! \n"
  else
    print "\n#{victor_num == 1 ? player1.name : player2.name} wins the round! "
  end
end

def play_single_round(player1, player2)
  get_choices(player1, player2)
  victor_num = equation(player1.choice, player2.choice)
  declare_victor(victor_num, player1, player2)
  increase_score(victor_num, player1, player2)
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
def announce_current_score(player1, player2)
  print "After #{player1.score + player2.score} rounds, the scores are: "
  print "#{player1.name}: #{player1.score}, "
  puts "#{player2.name}: #{player2.score}"
  puts
end

# asks for number of games in the set, and then plays until
# one play has won enough rounds to win the set.
def play_full_set(player1, player2)
  puts "Best of how many games?"
  wins_needed = determine_number_of_wins
  until (player1.score >= wins_needed) || (player2.score >= wins_needed)
    announce_current_score(player1, player2) if play_single_round(player1, player2) != 0
  end
  puts "#{player1.score > player2.score ? player1.name : player2.name} wins the set! \n"
  reset_scores(player1, player2)
end
#---------------------------------------------------------------------
def reset_scores(player1, player2)
  player1.reset_score
  player2.reset_score
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

def play_full_session(player1, player2)
  keep_playing = true
  while keep_playing
    play_full_set(player1, player2)
    keep_playing = continue?
  end
end


player1 = Player.new(player_number: 1)
player2 = Player.new(player_number: 2)
setup(player1, player2)
play_full_session(player1, player2)
puts "Thanks for playing!"
