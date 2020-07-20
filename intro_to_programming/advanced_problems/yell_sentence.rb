def yell_sentence(sent)
  words = sent.split(" ")
  yelled_words = words.map { |word| word.upcase + "!" }

  return yelled_words.join(" ")
end

puts yell_sentence("I have a bad feeling about this") #=> "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"
