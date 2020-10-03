class Tile
	def initialize(value)
		@given = value != "0"
		@value = value
	end

	def to_s
		@value
	end
end
