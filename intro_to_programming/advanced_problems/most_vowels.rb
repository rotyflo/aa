def most_vowels(sentence)
  counts = {}
  sentence.split.each { |word| counts[word] = count_vowels(word) }
  sorted = counts.sort_by { |word, count| count }

  return sorted[-1][0]
end

def count_vowels(word)
  vowels = "aeiou"
  count = 0
  word.each_char do |char|
    if vowels.include?(char)
      count += 1
    end
  end

  return count
end

print most_vowels("what a wonderful life") #=> "wonderful"
