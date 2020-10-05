require "byebug"
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
				if tile.given
					tile.red
				elsif tile == "0"
					tile.blank
				else
					tile.solved? ? tile.green : tile.white
				end
			end
			output += "#{i} | #{line.join(" ")}\n"
		end
		print output + "\n"
	end

	def get_tile
		y, x = get_position
		@grid[x][y]
	end

	def get_position
		print "Position: "
		gets.chomp.split("")[0..1].map(&:to_i)
	end

	def update_position(tile, str)
		tile.value = str unless tile.given
	end

	def solved?
		unsolve_all_tiles
		is_solved = true
		@grid.each { |row| is_solved = false unless uniq_tiles?(row) }
		@grid.transpose.each { |col| is_solved = false unless uniq_tiles?(col) }
		@grid.each_3x3 { |square| is_solved = false unless uniq_tiles?(square) }
		is_solved
	end

	def uniq_tiles?(section)
		nums = section.map { |tile| tile.to_s }
		nums.select! { |num| num != "0" }
		is_unique = nums.uniq.length == 9
		solve_tiles(section) if is_unique
		is_unique
	end

	def solve_tiles(section)
		section.each { |tile| tile.mark_solved }
	end

	def unsolve_all_tiles
		@grid.flatten.each { |tile| tile.mark_unsolved }
	end
end

class Array
	def each_3x3(&prc)
		squares = Array.new(9) { [] }
		(0..2).each { |i| (0..2).each { |j| squares[0] << self[i][j] } }
		(0..2).each { |i| (3..5).each { |j| squares[1] << self[i][j] } }
		(0..2).each { |i| (6..8).each { |j| squares[2] << self[i][j] } }
		(3..5).each { |i| (0..2).each { |j| squares[3] << self[i][j] } }
		(3..5).each { |i| (3..5).each { |j| squares[4] << self[i][j] } }
		(3..5).each { |i| (6..8).each { |j| squares[5] << self[i][j] } }
		(6..8).each { |i| (0..2).each { |j| squares[6] << self[i][j] } }
		(6..8).each { |i| (3..5).each { |j| squares[7] << self[i][j] } }
		(6..8).each { |i| (6..8).each { |j| squares[8] << self[i][j] } }
		squares.each do |square|
			prc.call(square)
		end
	end
end

# x x x		[0, 0], [1, 0], [2, 0]
# x x x		[0, 1], [1, 1], [2, 1]
# x x x		[0, 2], [1, 2], [2, 2]

# 012 012, 012 345, 012 678
