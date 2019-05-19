require "byebug"

# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    num_1, num_2 = [num_1, num_2].sort

    (1..num_2).each do |i|
        mutiple_1 = num_1 * i

        return mutiple_1 if mutiple_1 % num_2 == 0
    end
end

least_common_multiple(21, 7)


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    count = Hash.new(0)

    (0...str.length - 1).each do |i|
        bigram = str[i..i + 1]

        count[bigram] += 1
    end

    count.sort_by { |k, v| v } [-1][0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inverse_hash = {}
        self.each { |k, v| inverse_hash[v] = k }
        inverse_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        
        self.each_with_index do |x, i|
            self[i + 1..-1].each do |y|
                count += 1 if x + y == num
            end
        end

        count
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new { |a, b| a <=> b }
        sorted = false

        while !sorted
            sorted = true

            (0...self.length - 1).each do |i|
                a = self[i]
                b = self[i + 1]

                if prc.call(a, b) == 1
                    self[i], self[i + 1] = b, a

                    sorted = false
                end
            end
        end

        self
    end
end