def opposite_count(nums)
  amount_of_pairs = 0

  nums.each_with_index do |num1, i|
    nums.each_with_index do |num2, j|
      if i < j && num1 + num2 == 0
        amount_of_pairs += 1
      end
    end
  end

  return amount_of_pairs
end

puts opposite_count([ 2, 5, 11, -5, -2, 7 ]) # => 2
puts opposite_count([ 21, -23, 24 -12, 23 ]) # => 1
