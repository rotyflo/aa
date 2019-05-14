class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []

    @secret_word.each_char.with_index { |sec_c, i| indices << i if sec_c == char }

    indices
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    attempted = self.already_attempted?(char)
    matching_indices = self.get_matching_indices(char)
    
    @remaining_incorrect_guesses -= 1 if matching_indices.empty?

    if attempted
      puts "that has already been attempted"
      
      false
    else
      self.fill_indices(char, matching_indices)
      
      @attempted_chars << char
      
      true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    input = gets.chomp

    self.try_guess(input)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "WIN"
      return true
    end

    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end

    false
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end

    false
  end
end
