# Write a method subsets that will return all subsets of an array.
#
# You can implement this as an Array method if you prefer.
#
# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:
#
# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding
# subset that is the same, except it also does contain 3.

class Array
	def subsets
		return [[]] if empty?

		subs = self[0...-1].subsets
		subs + subs.map { |sub| sub + [last] }
	end
end

p [].subsets
# => [[]]
p [1].subsets
# [].subsets + [].subsets.map { |[]| [] + 1 } # mapped [1]
# [[]] + [[1]]
# => [[], [1]]
p [1, 2].subsets
# [1].subsets + [1].subsets.map { |[]| [] + [2] } # mapped [2]
# [1].subsets + [1].subsets.map { |[1]| [1] + [2] } # mapped [1, 2]
# [1].subsets + [[2], [1, 2]]
# => [[], [1], [2], [1, 2]]
p [1, 2, 3].subsets
# [1, 2].subsets + [1, 2].subsets.map { |[]| [] + [3] } # mapped [3]
# [1, 2].subsets + [1, 2].subsets.map { |[1]| [1] + [3] } # mapped [1, 3]
# [1, 2].subsets + [1, 2].subsets.map { |[2]| [2] + [3] } # mapped [2, 3]
# [1, 2].subsets + [1, 2].subsets.map { |[1, 2]| [1, 2] + [3] } # mapped [1, 2, 3]
# [1, 2].subsets + [[3], [1, 3], [2, 3], [1, 2, 3]]
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
