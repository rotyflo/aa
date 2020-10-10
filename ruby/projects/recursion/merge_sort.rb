# Implement a method merge_sort that sorts an Array:
#
# The base cases are for arrays of length zero or one.
# Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.

def merge_sort(arr)
	return arr if arr.length <= 1

	left = arr.take(arr.length / 2)
	right = arr.drop(arr.length / 2)

	left = merge_sort(left)
	right = merge_sort(right)

	merge(left, right)
end

def merge(left, right)
	merged = []
	until left.empty? || right.empty?
		if left.first <= right.first
			merged << left.shift
		else
			merged << right.shift
		end
	end

	merged + left + right
end

# tests
p merge_sort([]) # []
p merge_sort([0, -1]) # [-1, 0]
p merge_sort((0...10).to_a.shuffle) # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
