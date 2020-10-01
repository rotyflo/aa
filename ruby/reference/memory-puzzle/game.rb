require_relative "board"
require_relative "player"

class Game
	def initialize
		@board = Board.new
		@player = Player.new
		@prev_guess = nil
		@flipped_cards = 0
		@turns = 0
	end

	def play
		@board.populate
		until over
			@board.render
			guess = @board.reveal(@player.get_position)
			if guess
				@flipped_cards += 1
				determine_match(guess)
				@prev_guess = guess
			end
		end
		finish_game
	end

	def determine_match(guess)
		if @flipped_cards == 2
			@flipped_cards = 0
			unless guess == @prev_guess
				@board.render
				sleep(2)
				guess.hide
				@prev_guess.hide
			end
			@turns += 1
		end
	end

	def over
		@board.won?
	end

	def finish_game
		@board.render
		print "You finished in #{@turns.to_s} turns!\n"
	end
end

game = Game.new
game.play
