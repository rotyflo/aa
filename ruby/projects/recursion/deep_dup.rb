class Array
	def deep_dup
		dup_arr = []
		self.each do |ele|
			ele.is_a?(Array) ? dup_arr << ele.deep_dup : dup_arr << ele
		end
		dup_arr
	end
end

arr = [1, [2], [3, [4]]]

# Recursive 'deep_dup' duplicates any arrays within the top level array
arr_deep_dup = arr.deep_dup
arr_deep_dup[1] << "deep dup"
p arr          # => [1, [2], [3, [4]]]
p arr_deep_dup # => [1, [2, "deep dup"], [3, [4]]]

# Ruby's 'dup' only duplicates the array that calls it, not the arrays within
arr_dup = arr.dup
arr_dup[1] << "dup"
p arr     # => [1, [2, "dup"], [3, [4]]]
p arr_dup # => [1, [2, "dup"], [3, [4]]]
