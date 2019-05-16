require_relative "board"
require_relative "player"

class Battleship
  attr_reader :player, :board

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    
    puts @board.num_ships.to_s + " ships"

    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose"
      return true
    end

    false
  end

  def win?
    if @board.num_ships == 0
      puts "you win"
      return true
    end

    false
  end

  def game_over?
    win? || lose?
  end

  def turn
    pos = @player.get_move

    @remaining_misses -= 1 if !@board.attack(pos)
    @board.print

    puts @remaining_misses.to_s + " misses remaining" 
  end
end
