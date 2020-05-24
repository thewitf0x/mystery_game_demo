require './start_room_choices.rb'

class Mystery
  attr_writer :game_over

  def initialize
    @game_over = false
  end

  def play_game
    start_room = StartRoom.new
    start_room.intro
  end

  def restart
    puts "Would you like to start over? Y/N"
    answer = $stdin.gets.chomp
    if answer.downcase == "y"
      play_game()
    else
      exit(0)
    end
  end
end
