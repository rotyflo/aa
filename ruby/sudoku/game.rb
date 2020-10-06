require_relative "board"

class Game
	def initialize(filename)
		@board = Board.new(filename)
	end

	def play
		until @board.solved?
			@board.render
			tile = @board.select_tile
			val = get_value
			@board.update_tile(tile, val) unless tile == nil || val == nil
		end
		@board.render
		puts "You win!"
	end

	def get_value
		print "Number: "
		val = gets.chomp[0]
		return val if is_valid?(val)
		nil
	end

	def is_valid?(val)
		"0123456789".include?(val)
	end
end

game = Game.new("puzzles/sudoku1.txt")
game.play
