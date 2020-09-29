require_relative "board"
require_relative "player"

class Game
	def initialize
		@board = Board.new
		@player = Player.new
		@prev_guess = nil
		@flipped_cards = 0
	end

	def play
		@board.populate

		while !over
			system("clear")
			@board.render
			x, y = @player.get_position
			guess = @board.reveal(x, y)
			@flipped_cards += 1
			if @flipped_cards == 2
				@flipped_cards = 0
				unless guess == @prev_guess
					system("clear")
					@board.render
					sleep(2)
					guess.hide
					@prev_guess.hide
				end
			end
			@prev_guess = guess
		end
	end

	def over
		@board.won?
	end
end

game = Game.new
game.play