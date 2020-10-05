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
			line = row.map do |tile|
				if tile.given && tile != "0"
					tile.unchangeable
				elsif tile != "0"
					tile
				else
					tile.blank
				end
			end
			output += line.join(" ") + "\n"
		end
		print output
	end

	def get_tile
		y, x = get_position
		@grid[x][y]
	end

	def get_position
		gets.chomp.split("")[0..1].map(&:to_i)
	end

	def update_position(tile, str)
		tile.value = str unless tile.given
	end

	def solved?
		false
	end
end
