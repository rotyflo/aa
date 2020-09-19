def is_prime?(num)
    num < 2 ? false : (2..num/2).none? { |factor| num % factor == 0 }
end

def nth_prime(n)
    primes = []

    i = 2
    while primes.length < n
        primes << i if is_prime?(i)
        i += 1
    end
    primes[-1]
end

def prime_range(min, max)
    (min..max).to_a.select { |n| is_prime?(n) }
end