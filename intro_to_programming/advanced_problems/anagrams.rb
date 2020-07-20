def anagrams?(word1, word2)
  return char_count(word1) == char_count(word2)
end

def char_count(word)
  hash = Hash.new(0)
  word.each_char { |char| hash[char] += 1 }

  return hash
end

puts anagrams?("cat", "act")          #=> true
puts anagrams?("restful", "fluster")  #=> true
puts anagrams?("cat", "dog")          #=> false
puts anagrams?("boot", "bootcamp")    #=> false
