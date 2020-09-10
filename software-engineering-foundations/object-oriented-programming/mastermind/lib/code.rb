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

  def num_exact_matches(guess)
    @pegs.each_with_index.count { |peg, i| peg == guess[i] }
  end

  def num_near_matches(guess)
    guess.pegs.each_with_index.count do |peg, i|
      @pegs.include?(peg) && !(peg == @pegs[i])
    end
  end

  def ==(guess)
    return false if @pegs.length != guess.length
    @pegs.each_with_index.all? { |peg, i| peg == guess[i] }
  end
end
