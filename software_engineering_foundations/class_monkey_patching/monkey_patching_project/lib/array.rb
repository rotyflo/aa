# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.empty? then nil else self.max - self.min end
    end

    def average
        if self.empty? then nil else self.sum * 1.0 / self.length end
    end

    def median
        if self.empty?
            nil
        elsif self.length.odd?
            self.sort[self.length / 2]
        else
            (self.sort[self.length / 2] + self.sort[self.length / 2 - 1]) * 1.0 / 2
        end
    end

    def counts
        hash = Hash.new(0)
        
        self.each { |el| hash[el] += 1 }

        hash
    end

    def my_count(val)
        count = 0

        self.each { |el| count += 1 if el == val }

        count
    end

    def my_index(val)
        self.each_with_index { |el, i| return i if el == val }

        nil
    end

    def my_uniq
        uniq_array = []

        self.each { |el| uniq_array << el if !uniq_array.include?(el) }
        
        uniq_array
    end

    def my_transpose
        transd_arr = Array.new(self.length) {Array.new}

        self.each do |subarr|
            subarr.each_with_index { |el, i| transd_arr[i] << el }
        end

        transd_arr
    end
end
