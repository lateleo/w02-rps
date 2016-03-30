require "pry"
class Player

  attr_accessor :name, :choice
  attr_reader :score, :player_number

  def initialize (name:, player_number:)
    @name = name
    @player_number = player_number
    @choice = nil
    @score = 0
  end

# Asks the user to choose between "rock", "paper", or "scissors", and doesn't
# continue until the user's response matches one of those three. Then, it sets
# the player object's choice attribute to 0, 1, or 2, respectively, based on
# which response the user entered.
  def make_choice(rulebook)
    print "#{@name}, what is your choice? "
    while !rulebook.valid_moves.include?(response = gets.chomp.downcase)
      puts rulebook.error_message
    end
    @choice = rulebook.valid_moves.index(response)
  end

# Checks if the given number (generated by game.determine_outcome) matches
# the player_number attribute, and if so, increases the score attribute by 1.
  def increase_score(victor_num)
    @score += 1 if victor_num == @player_number
  end

# resets the player's score to 0. Used when starting a new set of n rounds.
  def reset_score
    @score = 0
  end

end

#binding.pry
