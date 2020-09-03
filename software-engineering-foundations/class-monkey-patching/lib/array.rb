# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        self.max - self.min if !self.empty?
    end

    def average
        self.sum / (self.length * 1.0) if !self.empty?
    end

    def median
        return nil if self.empty?

        sorted = self.sort
        mid_i = self.length / 2

        return sorted[mid_i] if self.length.odd?
        (sorted[mid_i] + sorted[mid_i - 1]) / 2.0
    end

    def counts
        counts = Hash.new(0)

        self.each { |ele| counts[ele] += 1 }

        counts
    end

    def my_count(val)
        count = 0
        self.each { |ele| count += 1 if ele == val }
        count
    end

    def my_index(val)
        self.each_with_index { |ele, i| return i if ele == val }
        nil
    end

    def my_uniq
        unique_arr = []
        self.each { |ele| unique_arr << ele if !unique_arr.include?(ele) }
        unique_arr
    end

    def my_transpose
        transposed_arr = []
        (0...self.length).each do |i|
            subarr = []
            (0...self.length).each { |j| subarr << self[j][i] }
            transposed_arr << subarr
        end
        transposed_arr
    end
end