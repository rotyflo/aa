# Write a recursive method permutations(array) that calculates all the
# permutations of the given array. For an array of length n there
# are n! different permutations. So for an array with three elements we
# will have 3 * 2 * 1 = 6 different permutations.

def permutations(arr)
	return [arr] if arr.length <= 1

	last = arr.pop
	previous_perms = permutations(arr)
	perms = []
	previous_perms.each do |perm|
		(0..perm.length).each { |i| perms << perm.dup.insert(i, last) }
	end
	perms
end

p permutations([]) # => [[]]
p permutations([1]) # => [[1]]
p permutations([1, 2]) # => [[2, 1], [1, 2]]

# Insert last element into every possible index of each element of permutations([1, 2])
# [2, 1] insert 3 at 0 == [3, 2, 1]
# [2, 1] insert 3 at 1 == [2, 3, 1]
# [2, 1] insert 3 at 2 == [2, 1, 3]
# repeat for [1, 2]
p permutations([1, 2, 3]) # => [[3, 2, 1], [2, 3, 1], [2, 1, 3]
                             # [[3, 1, 2], [1, 3, 2], [1, 2, 3]]
