# Write two versions of exponent that use two different recursions:

# this is math, not Ruby methods.

# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def exponent_1(base, power)
	return 1 if power == 0
	lesser_power = power - 1
	base_to_the_lesser_power = exponent_1(base, lesser_power)
	base * base_to_the_lesser_power
end

puts "method 1"
p exponent_1(0, 0)
p exponent_1(0, 1)
p exponent_1(1, 0)
p exponent_1(1, 1)
p exponent_1(1, 2)
p exponent_1(2, 0)
p exponent_1(2, 1)
p exponent_1(2, 2)

def exponent_2(base, power) # more complex, fewer stacks
	return 1 if power == 0
	return base if power == 1
	half_power = power / 2
	base_to_the_half_power_squared = exponent_2(base, half_power)**2
	return base_to_the_half_power_squared if power.even?
	base * base_to_the_half_power_squared
end

puts "method 2"
p exponent_2(0, 0)
p exponent_2(0, 1)
p exponent_2(1, 0)
p exponent_2(1, 1)
p exponent_2(1, 2)
p exponent_2(2, 0)
p exponent_2(2, 1)
p exponent_2(2, 2)
