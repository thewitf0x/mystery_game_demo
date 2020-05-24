require "./OutputText.rb"
class Window
    include Output

    attr_reader :smashed, :visited

    def initialize
        @visited = false
        @smashed = false
        @exhausted = false
    end

    def exhausted?
        return true if @visited && @smashed
        false
    end

    def look_at_window
        if exhausted?()
            @exhausted = true
        end
        
        if !@visited
            Output.display_text("./story/window.txt")
            @visited = true
        elsif @exhausted
            Output.display_text("./story/window_exhausted.txt")
            return
        else
            Output.display_text("./story/window_visited.txt")
        end
        Output.display_text("./story/window_options.txt")
        Output.prompt_player
    
        choice = $stdin.gets.chomp
        if choice == "1"
            if @smashed == true
                puts "You smashed it open! You can't open it now."
                look_at_window()
            end

            open_window()
        elsif choice == "2"
            if @smashed == true
              puts "You already smashed it open!"
              look_at_window()
            end

            smash()
        elsif choice == "3"
            return
        else
            return
        end
        look_at_window()
    end

    def open_window
        Output.display_text("./story/window_locked.txt")
    end

    def smash
        Output.display_text("./story/window_smash_options.txt")
        Output.prompt_player
        choice = $stdin.gets.chomp
        if choice == "1"
            smash_with_fist()
        elsif choice == "2"
            smash_with_chair()
        else
            return
        end
    end

    def smash_with_chair
        @smashed = true
        Output.display_text("./story/window_with_chair.txt")
        Output.display_text("./story/window_smashed.txt")
        return
    end

    def smash_with_fist
        @smashed = true
        Output.display_text("./story/window_with_fist.txt")
        Output.display_text("./story/window_fist_options.txt")
        Output.prompt_player
        choice = $stdin.gets.chomp
        if choice == "1"
            Output.you_died("bleeding")
        elsif choice == "2"
            Output.display_text("./story/window_healed.txt")
            Output.display_text("./story/window_smashed.txt")
        else
            Output.you_died("bleeding")
        end
    end

end