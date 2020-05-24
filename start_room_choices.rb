require "./OutputText.rb"
require "./oven.rb"
require "./coffee_table.rb"
require "./player.rb"
require "./mirror.rb"
require "./door.rb"
require "./window.rb"

class StartRoom
  include Output

  def initialize
    @oven = Oven.new
    @player = Player.new
    @coffee_table = CoffeeTable.new
    @mirror = Mirror.new
    @door = Door.new
    @window = Window.new
  end

  def intro
    Output.display_text("./story/intro.txt")
    Output.prompt_player

    choice = $stdin.gets.chomp

    if choice == "1"
      @oven.oven_realisation()
    elsif choice == "2"
      @oven.blindness()
      @oven.oven_realisation()
    else
      Output.you_died("gas")
    end

    start_room()
  end

  def start_room
    Output.display_text("./story/start_room.txt")
    main_options()
    @oven.check_gas
  end

  def main_options()
    @oven.check_gas
    Output.display_text("./story/main_options.txt")
    choice = $stdin.gets.chomp

    if choice == "1"
      @oven.check_gas
      @oven.oven()
    elsif choice == "2"
      @oven.check_gas
      @coffee_table.contents()
      if @coffee_table.pills_taken == 2
        @mirror.reflected = false
        @player.boost_health
      end
    elsif choice == "3"
      @oven.check_gas
      @window.look_at_window
    elsif choice == "4"
      @oven.check_gas
      if @player.health > 30 && @mirror.reflected == false
        @mirror.reflection("healthy")
      elsif @player.health == 30 && @mirror.reflected == false
        @mirror.reflection()
      else
        @mirror.reflect_again
      end
    elsif choice == "5"
      @oven.check_gas
      if @door.opened == false
        @door.door_options
      else
        @door.open_door
      end
    else
      @oven.check_gas
      puts "Need to make a decision..."
    end

    main_options()
  end
end
