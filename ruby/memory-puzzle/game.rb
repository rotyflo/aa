require_relative "board"
require_relative "player"
require_relative "computer"

class Game
	def initialize(player)
		@board = Board.new
		@player = player
		@prev_guess = nil
		@flipped_cards = 0
		@turns = 0
	end

	def play
		@board.populate
		until over
			@board.render
			pos = @player.get_position
			guess = @board.reveal(pos)
			if guess
				@player.receive_revealed_card(pos, guess.face_val)
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

game = Game.new(Computer.new)
game.play
