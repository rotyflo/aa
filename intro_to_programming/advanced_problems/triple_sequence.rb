def triple_sequence(start, length)
  arr = [start]
  (length - 1).times { arr << arr[-1] * 3 }

  return arr
end

print triple_sequence(2, 4) # => [2, 6, 18, 54]
puts
print triple_sequence(4, 5) # => [4, 12, 36, 108, 324]
puts
