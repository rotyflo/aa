# Silly question, silly answer
def greatest_factor_array(arr)
  return arr.map { |num| (num / 2.0 + ((num % 2) * num / 2.0)).round(0) }
end

print greatest_factor_array([16, 7, 9, 14]) # => [8, 7, 9, 7]
puts
print greatest_factor_array([30, 3, 24, 21, 10]) # => [15, 3, 12, 21, 5]
puts
