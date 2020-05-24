require_relative './start_room_choices.rb'
require './mystery.rb'
require './OutputText.rb'

include Output

game = Mystery.new

game.play_game()
game.restart()
