# testing
require_relative "card"
# testing

class Computer
	# On its first guess, if it knows where 2 matching cards are, guess one of
	# them, otherwise guess randomly among cards it has not yet seen.
	#
	# On its second guess, if its first guess revealed a card whose value matches
	# a known location, guess that location, otherwise guess randomly among cards
	# it has not yet seen.
	attr_reader :known_cards
	def initialize
		@first_turn = true
		@known_cards = {}
		@known_matches = []
		@matched_cards = []
	end

	def get_position
		# very first turn
		if @known_cards.empty?
			return rand_pos
		else
			check_for_matches
			if @known_matches
				@known_matches.each do |card|
					return @known_cards[card] if !@matched_cards.include?(card)
				end
			end
			return rand_pos
		end
		nil
	end

	def check_for_matches
		@known_cards.keys.each do |card|
			count = @known_cards.keys.count { |val| val == card }
			if count == 2 && !@known_matches.include?(card)
				@known_matches << card
			end
		end
		@known_matches.map! { |card1, card2| card1 < card2 }
	end

	def rand_pos
		Array.new(2) { (0...4).to_a.sample }
	end

	def receive_revealed_card(pos, card)
		@known_cards[card] = pos
	end

	def receive_match
		# should take in two positions which are a successful match.
		# I stored these in an instance variable @matched_cards
	end
end
