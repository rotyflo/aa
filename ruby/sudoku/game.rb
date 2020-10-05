require_relative "board"

class Game
	def initialize(filename)
		@board = Board.new(filename)
	end

	def play
		until @board.solved?
			@board.render
			print "Position: "
			tile = @board.get_tile
			print "Number: "
			num = get_val
			@board.update_position(tile, num)
		end
		@board.render
		puts "You win!"
	end

	def get_val
		gets.chomp[0]
	end
end

game = Game.new("puzzles/sudoku1_almost.txt")
game.play
