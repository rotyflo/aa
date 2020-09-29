class Card
  def initialize(face_val)
    @face_val = face_val
    @faceup = false
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

  def ==(val)
		@face_val == val
  end
end