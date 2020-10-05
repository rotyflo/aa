require "colorize"

class Tile
	attr_writer :value
	attr_reader :given, :blank

	def initialize(value)
		@value = value
		@given = @value != "0"
		@blank = "."
		@solved = false
	end

	def ==(string)
		self.to_s == string
	end

	def to_s
		@value
	end

	def white
		@value.colorize(:white)
	end

	def red
		@value.colorize(:red)
	end

	def green
		@value.colorize(:green)
	end

	def solved?
		@solved
	end

	def render
		return red if @given
		return @blank if @value == "0"
		solved? ? green : white
	end

	def mark_solved
		@solved = true
	end

	def mark_unsolved
		@solved = false
	end
end
