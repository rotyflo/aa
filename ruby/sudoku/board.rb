require "set"
require "colorize"
require_relative "tile"

class Board
	def self.from_file(filename)
		lines = IO.readlines(filename, chomp: true)
		lines.map! do |line|
			line.split("").map! { |char| Tile.new(char) }
		end
	end

	attr_reader :grid

	def initialize(filename)
		@grid = Board.from_file(filename)
	end

	def render
		system("clear")
		output = "    0 1 2 3 4 5 6 7 8\n"
		output += "  -------------------\n"
		@grid.each_with_index do |row, i|
			line = row.map do |tile|
				if tile.given && tile != "0"
					tile.unchangeable
				elsif tile != "0"
					tile
				else
					tile.blank
				end
			end
			line.map! { |tile| tile.to_s.colorize(:green) } if uniq_tiles?(row)
			output += "#{i} | #{line.join(" ")}\n"
		end
		print output + "\n"
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
		rows_solved = @grid.all? { |row| uniq_tiles?(row) }
		cols_solved = @grid.transpose.all? { |col| uniq_tiles?(col) }
		rows_solved && cols_solved
	end

	def uniq_tiles?(row)
		nums = row.map { |tile| tile.to_s }
		nums.select! { |num| num != "0" }
		nums.uniq.length == 9
	end
end
