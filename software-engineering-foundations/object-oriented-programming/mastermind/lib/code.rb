class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.keys.include?(char.upcase) }
  end

  def self.random(length)
    Code.new(Array.new(length, POSSIBLE_PEGS.keys[rand(POSSIBLE_PEGS.length)]))
  end

  def self.from_string(string)
    Code.new(string.split(''))
  end

  attr_reader :pegs

  def initialize(chars)
    raise 'Invalid pegs' if !Code.valid_pegs?(chars)
    @pegs = chars.map(&:upcase)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end
end
