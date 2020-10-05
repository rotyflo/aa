require_relative "board"

class Game
	def initialize(filename)
		@board = Board.new(filename)
	end

	def play
		until @board.solved?
			@board.render
			tile = @board.get_tile
			num = get_val
			@board.update_position(tile, num)
		end
	end

	def get_val
		gets.chomp[0]
	end
end

game = Game.new("puzzles/sudoku1.txt")
game.play
