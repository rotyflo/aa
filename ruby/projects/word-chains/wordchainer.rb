require "set"

class WordChainer
	def initialize(dictionary)
		@dictionary = Set.new(IO.readlines(dictionary, chomp: true))
	end

	def adjacent_words(word)
		adjacent_words = Set.new
		word.length.times do |i|
			str = "^" + word[0...i] + "." + word[i + 1..-1] + "$"
			regex = Regexp.new(str)
			adjacent_words += @dictionary.select { |entry| entry.match(regex) }
		end
		adjacent_words.delete(word)
	end
end

wordchainer = WordChainer.new("dictionary.txt")
p wordchainer.adjacent_words("mug")
