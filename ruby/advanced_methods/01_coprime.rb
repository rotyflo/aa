# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1, num_2)
    factors_1 = get_factors(num_1)
    factors_2 = get_factors(num_2)

    factors_1.each { |factor| return false if factors_2.include?(factor) }

    true
end

def get_factors(num)
    (2..num - 1).select { |i| i if num % i == 0 }
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
