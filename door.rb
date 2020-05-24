require "./OutputText.rb"

class Door
  include Output

  attr_reader :opened

  def initialize
    @keyhole_unblocked = false
    @handle_tried = false
    @opened = false
    @door_visited = false
  end

  def door_options
    if @door_visited == false
        @door_visited = true
        Output.display_text("./story/door.txt")
    else
        Output.display_text("./story/door_visited.txt")
    end

    Output.display_text("./story/door_options.txt")
    Output.prompt_player

    choice = $stdin.gets.chomp

    case choice
    when "1"
      keyhole_peek()
      door_options()
    when "2"
      door_handle()
    else
      return
    end
  end

  def keyhole_peek
    if !@keyhole_unblocked
      Output.display_text("./story/keyhole_blocked.txt")
      Output.prompt_player
      choice = $stdin.gets.chomp

      if choice == "1"
        unblock()
      else
        return
      end
    else
      Output.display_text("./story/keyhole_unblocked.txt")
      return
    end
  end

  def unblock
    @keyhole_unblocked = true
    Output.display_text("./story/keyhole_unblock.txt")
    Output.display_text("./story/keyhole_unblocked.txt")
  end

  def door_handle
    Output.display_text("./story/door_handle.txt")
    Output.prompt_player
    choice = $stdin.gets.chomp
    case choice
    when "1"
      leave_room()
    else
      return
    end
  end

  def open_door
    puts "Would you like to leave the room now?"
    puts "\t1. Yes"
    puts "\t2. No"
    Output.prompt_player
    choice = $stdin.gets.chomp
    if choice == "1"
      leave_room()
    else
      return
    end
  end

  def leave_room
    puts "You've escaped the room."
    puts "That's the end of this DEMO."
    puts "I hope you enjoyed it."
    puts "YOU WIN...(FOR NOW!)"
    puts "[TO BE CONTINUED]"
    exit(0)
  end
end
