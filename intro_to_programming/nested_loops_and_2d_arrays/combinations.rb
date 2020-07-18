def combinations(arr)
  new_arr = []

  arr.each_with_index do |el1, i|
    j = i + 1

    while j < arr.length
      el2 = arr[j]
      new_arr << [el1, el2]
      j += 1
    end
  end

  return new_arr
end

print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
puts

print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
puts
