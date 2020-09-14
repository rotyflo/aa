require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (n * n) / 2
        @length = n
    end

    def start_game
        @board.place_random_ships
        if @board.num_ships > 1
            p @board.num_ships.to_s + ' ships'
        else
            p '1 ship'
        end
        @board.print
    end

    def lose?
        return false if @remaining_misses > 0

        p 'you lose'
        true
    end

    def win?
        return false if @board.num_ships > 0

        p 'you win'
        true
    end

    def game_over?
        win? || lose?
    end

    def turn
        valid_pos = false
        while !valid_pos
            pos = @player.get_move
            if pos.length == 2 && (0...@length).include?(pos[0]) && (0...@length).include?(pos[1])
                valid_pos = true
            end
        end
        is_hit = @board.attack(pos)
        @board.print
        
        @remaining_misses -= 1 if !is_hit
        if @remaining_misses > 1
            p @remaining_misses.to_s + ' remaining misses'
        elsif @remaining_misses == 1
            p '1 remaining miss'
        end
    end
end
