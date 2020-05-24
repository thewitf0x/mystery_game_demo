require "./OutputText.rb"

class Oven
  include Output

  attr_accessor :gas_off

  def initialize
    @gas_off = false
    @time = Time.new
  end

  def out_of_time?
    if @gas_off == true
      return false
    end

    current_time = Time.now
    if current_time.hour > @time.hour && current_time.min > 4
      return true
    elsif current_time.hour == @time.hour && (current_time.min - @time.min) > 5
      return true
    end
    false
  end

  def check_gas
    if out_of_time?()
      Output.you_died("time")
    end
  end

  def oven_realisation()
    Output.display_text("./story/oven_realisation.txt")
    Output.prompt_player
    choice = $stdin.gets.chomp

    if choice == "1"
      escaped_oven()
    else
      Output.you_died("gas")
    end
  end

  def escaped_oven()
    Output.display_text("./story/escaped_oven.txt")
  end

  def lifeless_oven()
    Output.display_text("./story/lifeless_oven.txt")
  end

  def oven
    if @gas_off == false
      Output.display_text("./story/oven.txt")
      Output.prompt_player
      choice = $stdin.gets.chomp

      if choice == "1"
        Output.you_died("explosion")
      elsif choice == "3"
        return
      elsif choice == "2"
        Output.display_text("./story/gas_off.txt")
        @gas_off = true
      else
        return
      end
    else
      lifeless_oven()
    end
  end

  def blindness
    Output.display_text("./story/blindness.txt")
  end
end
