require "pry"
class Player

attr_accessor :name, :choice
attr_reader :score, :player_number

  def initialize (player_number:)
    @name = name
    @player_number = player_number
    @choice = nil
    @score = 0
  end

# stalls until user responds with "rock", "paper", or "scissors", and then
# sets the choice as 0, 1 or 2, respectively.
  def make_choice
    print "#{@name}, what is your choice? "
    until ["rock", "paper", "scissors"].include?(response = gets.chomp.downcase)
      puts "Please respond with 'rock', 'paper', or 'scissors'."
    end
    @choice = ["rock", "paper", "scissors"].index(response)
  end

# takes 0, 1 or 2 as an input, representing the outcome of a round, and increases
  def increase_score(victor_num)
    @score += 1 if victor_num == @player_number
  end

# resets the score to 0. Used when starting a new set of "best of n rounds."
  def reset_score
    @score = 0
  end

end

#binding.pry
