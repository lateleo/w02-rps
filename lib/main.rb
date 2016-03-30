require "pry"
require_relative "player.rb"
require_relative "game.rb"
require_relative "referee.rb"

game = Game.new
rulebook = Rulebook.new
game.setup
game.play_full_session(rulebook)
