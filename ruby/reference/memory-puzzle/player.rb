class Player
	def get_position
		position = []
		until position.length == 2 && position.all? { |ele| (0..4).to_a.include?(ele) }
			print "Select a position: "
			position = gets.chomp.split("").map(&:to_i)
		end
		position
	end
end