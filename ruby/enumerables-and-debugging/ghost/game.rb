require "set"
require_relative "player"

class Game
    def initialize(names)
        @players = names.map { |name| Player.new(name.upcase) }
        @player_i = 0
        @fragment = ""
        @dictionary = Set.new(IO.readlines("dictionary.txt", chomp: true))
    end

    def run
        print "\nWelcome to Ghost!\n"
        print "Guess one letter at a time.\n"
        print "You will earn 1 letter for each guess that doesn't build towards a new word.\n"
        print "You lose if you complete a word or earn 5 letters, spelling 'GHOST'.\n"
        print "Last one standing wins.\n"

        while !over?
            play_round
        end

        print "\n#{previous_player.name} loses!\n"
    end

    def play_round
        print_score
        take_turn(current_player)
        next_player!
    end

    def current_player
        @players[@player_i]
    end

    def previous_player
        @players[@player_i - 1]
    end

    def next_player!
        @player_i = (@player_i + 1) % @players.length
    end

    def print_score
        print "\n#{current_player.name}: #{score(current_player)}\n"
    end

    def take_turn(player)
        guess = current_player.guess.downcase
        @fragment += guess if valid_play?(guess)
        print "\nWord: #{@fragment.upcase}\n"
    end

    def valid_play?(char)
        if "abcdefghijklmnopqrstuvwxyz".include?(char)
            if @dictionary.any? { |word| word.start_with?(@fragment + char) }
                return true
            end
        end
        
        current_player.alert_invalid_guess
        false
    end

    def score(player)
        player.losses < 0 ? "" : "GHOST"[0..player.losses]
    end

    def over?
        previous_player.losses == 4 || @dictionary.include?(@fragment)
    end
end

print "\nEnter names one by one."
print "\nFinish input process by entering 'end'.\n"
names = []
while names.last != "end"
    print "Player name: "
    names << gets.chomp.downcase
end
names.pop

game = Game.new(names)
game.run
