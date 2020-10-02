class Card
	attr_reader :face_val

	def initialize(face_val)
		@face_val = face_val
		@faceup = false
	end

	def faceup?
		@faceup
	end

	def display
		@face_val if @faceup
	end

	def hide
		@faceup = false
	end

	def reveal
		@faceup = true
	end

	def to_s
		@face_val.to_s
	end

	def ==(card)
		self.to_s == card.to_s
	end

	def <(card)
		self.to_s < self.to_s
	end
end
