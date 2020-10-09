# Write a recursive and an iterative Fibonacci method.
# The method should take in an integer n and return the
# first n Fibonacci numbers in an array.
#
# You shouldn't have to pass any arrays between methods;
# you should be able to do this just passing a single argument
# for the number of Fibonacci numbers requested.

# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55

# ITERATIVE
def iterative_fib_sequence(n)
	fib = [0]
	n.times do
		if fib.length > 2
			fib << fib[-1] + fib[-2]
		else
			fib << 1
		end
	end
	fib
end

(0..10).each do |n|
	p iterative_fib_sequence(n)
end


# RECURSIVE
def recursive_fib_sequence(n)
	(0..n).map { |num| recursive_fib(num) }
end

def recursive_fib(n)
	return 0 if n < 1
	return 1 if n < 3
	recursive_fib(n - 1) + recursive_fib(n - 2)
end

(0..10).each do |n|
	p recursive_fib_sequence(n)
end
