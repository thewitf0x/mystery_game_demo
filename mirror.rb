require "./OutputText.rb"

class Mirror
  include Output

  attr_accessor :smashed, :reflected

  def initialize
    @smashed = false
    @reflected = false
  end

  def reflection(condition = nil)
    condition ||= "unhealthy"

    if condition == "healthy"
      Output.display_text("./story/mirror_high_health.txt")
    else
      Output.display_text("./story/mirror_low_health.txt")
    end

    @reflected = true
  end

  def reflect_again
    puts "No matter how many times you check, it's still you looking back."
    puts "Vanity is pitiful at the best of times. This is not."
  end

  def smash
    @smashed = true
  end
end
