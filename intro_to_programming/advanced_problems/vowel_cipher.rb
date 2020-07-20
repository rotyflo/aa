def vowel_cipher(string)
  vowels = "aeiou"
  enc_word = ""

  string.each_char do |char|
    if vowels.include?(char)
      enc_index = (vowels.index(char) + 1) % vowels.length
      enc_word += vowels[enc_index]
    else
      enc_word += char
    end
  end

  return enc_word
end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap
