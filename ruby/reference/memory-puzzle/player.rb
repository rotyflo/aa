require_relative "card"

class Player
	def get_position
		print "Enter position: "
		pos = gets.chomp.split("").map(&:to_i)
		return pos if pos.length == 2 && pos.all? { |i| (0..4).to_a.include?(i) }
		nil
	end
end
