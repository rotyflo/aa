require_relative "board"

class Game
	def initialize(filename)
		@board = Board.new(filename)
	end

	def play
		until @board.solved?
			@board.render
			pos = @board.get_position
			num = get_value
			@board.update_position(pos, num)
		end
		@board.render
		puts "You win!"
	end

	def get_value
		print "Number: "
		gets.chomp[0]
	end
end

game = Game.new("puzzles/sudoku1.txt")
game.play
