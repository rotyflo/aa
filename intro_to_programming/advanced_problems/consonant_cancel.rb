def consonant_cancel(sentence)
  return sentence.split.map { |word| cancel_consonants(word) }.join(" ")
end

def cancel_consonants(word)
  vowels = "aeiou"

  word.each_char.with_index do |char, i|
    if vowels.include?(char)
      return word[i..-1]
    end
  end
end

puts consonant_cancel("down the rabbit hole") #=> "own e abbit ole"
puts consonant_cancel("writing code is challenging") #=> "iting ode is allenging"
