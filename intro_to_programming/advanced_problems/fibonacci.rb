def fibonacci(length)
  arr = []
  length.times do |num|
    if num == 0
      arr << 1
    elsif arr.length > 1
      arr << arr[-1] + arr[-2]
    else
      arr << num
    end
  end

  return arr
end

print fibonacci(0) # => []
puts
print fibonacci(1) # => [1]
puts
print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
puts
print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
puts
