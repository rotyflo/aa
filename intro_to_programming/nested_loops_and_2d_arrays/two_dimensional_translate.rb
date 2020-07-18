def two_d_translate(arr)
  flat_arr = []

  arr.each do |sub_arr|
    element = sub_arr[0]
    amount = sub_arr[1]

    amount.times { flat_arr << element }
  end

  return flat_arr
end

arr_1 = [
  ['boot', 3],
  ['camp', 2],
  ['program', 0]
]

print two_d_translate(arr_1) # => [ 'boot', 'boot', 'boot', 'camp', 'camp' ]
puts

arr_2 = [
  ['red', 1],
  ['blue', 4]
]

print two_d_translate(arr_2) # => [ 'red', 'blue', 'blue', 'blue', 'blue' ]
puts
