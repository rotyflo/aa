class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.include?(char.upcase) }
  end

  attr_reader :pegs

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "array does not contain valid pegs"
    end
  end

  def self.random(length)
    pegs = Array.new(length).map! { POSSIBLE_PEGS.keys.sample }

    Code.new(pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    (0...length).count { |i| @pegs[i] == code.pegs[i] }
  end

  def num_near_matches(code)
    correct_colors = code.pegs.count { |color| @pegs.include?(color) }

    correct_colors - num_exact_matches(code)
  end

  def ==(code)
    @pegs == code.pegs
  end
end
