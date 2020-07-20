def summation_sequence(start, length)
  arr = [start]
  (length - 1).times { |num| arr << (1..arr[-1]).sum }

  return arr
end


print summation_sequence(3, 4) # => [3, 6, 21, 231]
print summation_sequence(5, 3) # => [5, 15, 120]
