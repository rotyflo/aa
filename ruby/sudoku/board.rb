require_relative "tile"

class Board
	def self.from_file(filename)
		lines = IO.readlines(filename, chomp: true)
		lines.map! do |line|
			line.split("").map! { |char| Tile.new(char) }
		end
	end

	def initialize(filename)
		@grid = Board.from_file(filename)
	end

	def render
		system("clear")
		output = ""
		@grid.each do |row|
			line = row.map { |tile| tile.to_s == "0" ? "." : tile.to_s }
			output += line.join(" ") + "\n"
		end
		print output
	end
end
