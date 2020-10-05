require "colorize"

class Tile
	attr_writer :value
	attr_reader :given, :blank

	def initialize(value)
		@value = value
		@given = @value != "0"
		@blank = "."
	end

	def ==(string)
		self.to_s == string
	end

	def to_s
		@value.to_s
	end

	def unchangeable
		@value.colorize(:red)
	end
end
