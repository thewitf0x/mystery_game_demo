require "./OutputText.rb"

class Player
  include Output

  attr_reader :health, :pills

  def initialize
    @health = 30
    @pills = 0
  end

  def boost_health
    if @health <= 80
      @health += 20
    else
      @health += (100 - @health)
    end
  end

  def lose_health
    @health -= 20

    check_health()
  end

  def low_health?
    if @healh < 30
      return true
    end
  end

  def check_health
    if @health <= 0
      Output.you_died("random")
    elsif low_health?()
      puts "Your health is very low."
    end
  end
end
