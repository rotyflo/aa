# Write a recursive method, range, that takes a start and an end
# and returns an array of all numbers in that range, exclusive.
# For example, range(1, 5) should return [1, 2, 3, 4]. If end < start,
# you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

def iterative_range(first, last)
	arr = []
	if first < last
		(first...last).each { |i| arr << i }
	end
	arr
end

puts "iterative"
p iterative_range(1, 5) # [1, 2, 3, 4]
p iterative_range(5, 1) # []
p iterative_range(-1, 5) # [-1, 0, 1, 2, 3, 4]


def recursive_range(first, last)
	return [] if last <= first
	[first] + recursive_range(first + 1, last)
end

puts "recursive"
p recursive_range(1, 5)
p recursive_range(5, 1)
p iterative_range(-1, 5)
