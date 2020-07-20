# For example, the base [1, 4, 6] gives us the following pyramid
#     15
#   5   10
# 1   4    6

def pyramid_sum(base)
  pyramid = [base]

  while pyramid[0].length > 1
    last_stack = pyramid[0]
    next_stack = []

    (0...last_stack.length - 1).each do |i|
      next_stack << last_stack[i] + last_stack[i + 1]
    end

    pyramid.unshift(next_stack)
  end

  return pyramid
end


print pyramid_sum([1, 4, 6]) #=> [[15], [5, 10], [1, 4, 6]]
puts

print pyramid_sum([3, 7, 2, 11]) #=> [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
puts
