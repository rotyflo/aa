require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    p 'Exact matches: ' + @secret_code.num_exact_matches(code).to_s
    p 'Near matches: ' + @secret_code.num_near_matches(code).to_s
  end

  def ask_user_for_guess
    p 'Enter a code'
    code = Code.from_string(gets.chomp)
    print_matches(code)
    code == @secret_code
  end
end
