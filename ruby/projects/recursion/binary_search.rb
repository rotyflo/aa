# Write a recursive binary search: binary_search(array, target).
# Note that binary search only works on sorted arrays.
# Make sure to return the location of the found object (or nil if not found!).
# Hint: you will probably want to use subarrays.

def binary_search(sorted_nums, target)
	return nil if sorted_nums.empty?

	mid_i = sorted_nums.length / 2
	mid_num = sorted_nums[mid_i]
	if mid_num < target
		right_side = sorted_nums[mid_i + 1..-1]
		found_index = binary_search(right_side, target)
		found_index += mid_i + 1 if found_index # add amount of indices to left
	elsif mid_num > target
		left_side = sorted_nums[0...mid_i]
		binary_search(left_side, target)
	else
		mid_i
	end
end

p binary_search([1, 2, 3], 1) # => 0
p binary_search([2, 3, 4, 5], 3) # => 1
p binary_search([2, 4, 6, 8, 10], 6) # => 2
p binary_search([1, 3, 4, 5, 9], 5) # => 3
p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil
