require './mystery.rb'

module Output

    def self.display_text(filename)
        txt = open(filename)
        puts txt.read
        return
    end

    def self.prompt_player(prompt = "> ")
        puts prompt
    end

    def self.you_died(reason = nil)
        game_over = "You died. Game Over."

        reasons = {
            'random' => [
                "We all die sooner or later.",
                "An easy mistake to make, shame you're out of lives.",
                "The end comes to us all.",
                "Life is but a game. Time to restart.",
                "Why do we fall, Bruce?"
            ],
            'time' => [
                "You forgot about the oven! The gas is too thick to go on. Your body gives up.",
                "The gas has been leaking this whole time! There's no oxygen left to breathe."
            ],
            'gas' => [
                "A minute passes, then two. Time slips away.",
                "Your vision clouds. Sleep beckons.",
                "You have lost all motorfunction. You can't even type a simple number.",
                "You blink slowly, dimwittedly, everything's a fog.",
                "Your mind turns to mush with the thick smell of poison.",
                "Your mind wasn't working. The numbers didn't make sense.",
                "Numbers, numbers, so many options. The gas thickens. Thoughts disappear.",
                "Darkness envelopes you. Gently drift away."
            ],
            'explosion' => [
                "There's a flash. Then an explosion. Don't worry. It's over now.",
            ],
            'drugs' => [
                "Didn't your parents teach you to say NO to drugs?",
                "Not the high you were expecting. Your eyes cross. Your legs give out.",
                "This is gonna be some downer. Blackness descends.",
                "When has medical advice ever stipulated a handful? Numpty."
            ],
            'bleeding' => [
                "The bleeding doesn't stop. It was over before it began."
            ]
        }

        reason ||= 'random'
    
        puts reasons[reason].shuffle[0]
        puts game_over
        exit(0)
    end

end