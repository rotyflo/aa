def frequent_letters(string)
  letter_freq = Hash.new(0)
  string.each_char { |char| letter_freq[char] += 1 }

  frequent_letters = []
  letter_freq.each do |char, freq|
    if freq > 2
      frequent_letters << char
    end
  end

  return frequent_letters
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts
