require_relative "board"

class Game
	def initialize(filename)
		@board = Board.new(filename)
	end

	def play
		greet
		until @board.solved?
			@board.render
			tile = @board.select_tile
			val = get_value
			@board.update_tile(tile, val) unless tile == nil || val == nil
		end
		@board.render
		puts "You win!"
	end

	def greet
		system("clear")
		puts "Welcome to Sudoku!"
		puts "\nHOW TO SOLVE:"
		puts "In order to complete this puzzle, each row, column and 3x3 grid"
		puts "must contain only 1 instance of each number 1 through 9."
		puts "\nHOW TO PLAY:"
		puts "Enter the indices of a location without space between them."
		puts "\teg. Position: 23"
		puts "\nEnter a single digit between 0 and 9."
		puts "\teg. Number: 8"
		puts "\nPress 'enter' to start."
		gets
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
