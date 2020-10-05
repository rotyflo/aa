require_relative "tile"

class Board
	def self.from_file(filename)
		lines = IO.readlines(filename, chomp: true)
		lines.map! { |line| line.split("").map! { |char| Tile.new(char) } }
	end

	def initialize(filename)
		@grid = Board.from_file(filename)
	end

	def render
		system("clear")
		output = "    0 1 2 3 4 5 6 7 8\n"
		output += "  -------------------\n"
		@grid.each_with_index { |row, i| output += render_row(row, i) }
		print output + "\n"
	end

	def render_row(row, row_num)
		line = row.map { |tile| render_tile(tile) }
		"#{row_num} | #{line.join(" ")}\n"
	end

	def render_tile(tile)
		return tile.red if tile.given
		return tile.blank if tile == "0"
		tile.solved? ? tile.green : tile.white
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
		@grid.each_square { |square| is_solved = false unless uniq_tiles?(square) }
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

class Array # monkey patch for consistent style in Board#solved?
	def each_square(&prc)
		squares = []
		axes = [(0..2), (3..5), (6..8)]
		axes.each { |axis| 3.times { |n| squares << get_square(axis, axes[n]) } }
		squares.each { |square| prc.call(square) }
	end

	def get_square(x_axis, y_axis)
		square = []
		x_axis.each { |x| y_axis.each { |y| square << self[x][y] } }
		square
	end
end
