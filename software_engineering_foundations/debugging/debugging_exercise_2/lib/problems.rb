# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
    largest_prime = nil

    (2..num).each { |n| largest_prime = n if is_prime?(n) && num % n == 0 }

    largest_prime
end

def is_prime?(num)
    return false if num < 2
    
    (2...num).each { |n| return false if num % n == 0 }

    true
end


def unique_chars?(str)
    chars = []

    str.each_char do |char|
        if !chars.include?(char) then chars << char else return false end
    end

    true
end


def dupe_indices(arr)
    dupes = {}

    arr.each_with_index do |el, i|
        if !dupes.has_key?(el) then dupes[el] = [i] else dupes[el] << i end
    end

    dupes.select { |k, v| v.length > 1 }
end


def ana_array(arr_1, arr_2)
    arr_1.each { |el| return false if !arr_2.include?(el) }
    arr_2.each { |el| return false if !arr_1.include?(el) }

    true
end