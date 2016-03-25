require "pry"
require_relative "player.rb"
require_relative "game.rb"

game = Game.new
game.setup
game.play_full_session
