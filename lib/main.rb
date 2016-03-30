require "pry"
require_relative "player.rb"
require_relative "game.rb"
require_relative "rps_rulebook.rb"
require_relative "rpslk_rulebook.rb"

game = Game.new
rulebook = Rps_rulebook.new
game.setup
game.play_full_session(rulebook)
