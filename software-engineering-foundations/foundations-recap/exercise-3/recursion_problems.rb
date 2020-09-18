def multiply(a, b)
    return 0 if b == 0
    b > 0 ? a + multiply(a, b - 1) : -a + multiply(a, b + 1)
end

# Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(num)
    return [] if num == 0
    num -= 1
    lucas_sequence(num) << lucas_number(num)
end

def lucas_number(num)
    return 2 if num == 0
    return 1 if num == 1
    lucas_number(num - 1) + lucas_number(num - 2)
end

# Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    prime_factors = factors(num).select { |factor| prime?(factor) }
    return [num] if prime_factors == [1]
    prime_factorization(num)
end

def factors(num, factor = num / 2)
    return [] if factor == 0
    if num % factor == 0
        factors(num, factor - 1) << factor
    else
        factors(num, factor - 1)
    end
end

def prime?(num, factor = num - 1)
    return false if factor < 0
    return true if factor < 2
    return false if num % factor == 0
    prime?(num, factor - 1)
end

# Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]