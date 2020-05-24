require "./OutputText.rb"

class CoffeeTable
  include Output

  attr_reader :pills, :pills_pocketed, :note_read, :pills_taken

  def initialize
    @pills = 10
    @pills_taken = 0
    @pills_pocketed = 0
    @note_read = false
    @note_destroyed = false
    @visited = false
    @pills_visited = false
  end

  def contents()
    if @visited == false
      Output.display_text("./story/coffee_table.txt")
      @visited = true
    else
      Output.display_text("./story/coffee_table_visited.txt")
    end
    Output.display_text("./story/coffee_table_options.txt")
    Output.prompt_player
    choice = $stdin.gets.chomp
    if choice == "1"
      pills()
    elsif choice == "2"
      note()
    elsif choice == "3"
      return
    end
  end

  def pills()
    if @pills > 0
      if !@pills_visited
        @pills_visited = true
        Output.display_text("./story/pills.txt")
      else
        Output.display_text("./story/pills_visited.txt")
      end
      Output.display_text("./story/pill_options.txt")
      Output.prompt_player
      choice = $stdin.gets.chomp

      if choice == "1"
        @pills_taken += 1
        @pills -= 1
        if @pills_taken > 2
          Output.you_died("drugs")
        end
        puts "Nothing happens. There are #{@pills} pills left."
        return
      elsif choice == "2"
        @pills_taken += 2
        @pills -= 2
        if @pills_taken > 2
          Output.you_died("drugs")
        end
        puts "It's miraculous. They must be fast acting."
        puts "There are #{@pills} pills left"
      elsif choice == "3"
        Output.you_died("drugs")
      elsif choice == "4"
        @pills_pocketed = @pills
        @pills = 0
        puts "You pocketed #{@pills_pocketed} pills for later."
      else
        return
      end
    else
      Output.display_text("./story/pills_all_gone.txt")
    end

    contents()
  end

  def note
    if @note_destroyed == true
      puts "You destroyed the note. I hope you read it first."
    else
      if @note_read == false
        Output.display_text("./story/note.txt")
      elsif @note_read == true
        Output.display_text("./story/note_already_read.txt")
      end

      Output.prompt_player
      choice = $stdin.gets.chomp

      if choice == "1"
        @note_read = true
        Output.display_text("./story/the_message.txt")
      elsif choice == "2"
        puts "You raise the pen, steady your tremulous hand with the other, and begin: "
        Output.prompt_player
        comparison = $stdin.gets.chomp
        puts "The handwriting is the same! You read it again to be sure."
        puts comparison
        puts "Definitely the same. You wrote the note."
      elsif choice == "3"
        @note_destroyed = true
        Output.display_text("./story/destroy_note.txt")
      else
        return
      end
    end

    contents()
  end
end
