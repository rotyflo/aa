require_relative "player"
require_relative "card"

class Computer
	# On its first guess, if it knows where 2 matching cards are, guess one of
	# them, otherwise guess randomly among cards it has not yet seen.
	#
	# On its second guess, if its first guess revealed a card whose value matches
	# a known location, guess that location, otherwise guess randomly among cards
	# it has not yet seen.

	def initialize
		@player = Player.new
		@known_cards = {}
	end

	def get_position
		@player.get_position
	end

	def receive_revealed_card(pos, val)
		@known_cards[val] = pos
	end

	def receive_match
		# should take in two positions which are a successful match.
		# I stored these in an instance variable @matched_cards
	end
end
