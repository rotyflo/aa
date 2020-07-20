def prime_factors(num)
  return (2..num/2).select do |divisor|
    prime?(divisor) && num % divisor == 0
  end
end

def prime?(num)
  if num < 2
    return false
  end

  (2...num).each do |divisor|
    if num % divisor == 0
      return false
    end
  end

  return true
end

print prime_factors(24) #=> [2, 3]
puts
print prime_factors(60) #=> [2, 3, 5]
puts
