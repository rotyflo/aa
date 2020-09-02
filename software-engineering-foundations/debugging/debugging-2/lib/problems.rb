# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(num)
    (2..num).select { |divisor| num % divisor == 0 && is_prime?(divisor) }.max
end


def is_prime?(num)
    (2...num).each { |factor| return false if num % factor == 0 }
    true
end


def unique_chars?(str)
    char_counts = Hash.new(0)

    str.each_char { |char| char_counts[char] += 1 }

    char_counts.values.none? { |count| count > 1 }
end


def dupe_indices(arr)
    char_indices = Hash.new([])

    arr.each.with_index do |char, i|
        char_indices[char] += [i]
    end

    char_indices.select { |char, indices| indices.length > 1 }
end


def ana_array(arr1, arr2)
    el_counts = Hash.new(0)

    arr1.each { |el| el_counts[el] += 1 }
    arr2.each { |el| el_counts[el] -= 1 }

    el_counts.values.none? { |count| count != 0 }
end