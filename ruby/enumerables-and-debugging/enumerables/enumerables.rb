class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        selected = []
        self.my_each { |ele| selected << ele if prc.call(ele) }
        selected
    end

    def my_reject(&prc)
        self.my_select { |ele| !prc.call(ele) }
    end

    def my_any?(&prc)
        self.my_each { |ele| return true if prc.call(ele) }
        false
    end

    def my_all?(&prc)
        self.my_each { |ele| return false if !prc.call(ele) }
        true
    end

    def my_flatten
        flattened = []
        self.my_each do |ele|
            ele.is_a?(Array) ? flattened += ele.my_flatten : flattened << ele
        end
        flattened
    end

    def my_zip(*arrs)
        zipped = []
        i = 0
        while i < self.length
            sub_arr = [self[i]]
            arrs.my_each { |ele| sub_arr << ele[i] }
            zipped << sub_arr
            i += 1
        end
        zipped
    end

    def my_rotate(n = 1)
        rotated = []
        i = 0
        while i < self.length
            rotated << self[(i + n) % self.length]
            i += 1
        end
        rotated
    end

    def my_join(joint = '')
        str = ''
        i = 0
        while i < self.length
            i == self.length - 1 ? str += self[i] : str += self[i] + joint
            i += 1
        end
        str
    end

    def my_reverse
        reversed_array = []
        self.my_each { |ele| reversed_array.unshift(ele) }
        reversed_array
    end
end


# my_each
return_value = [1, 2, 3].my_each do |num|
    puts num
end.my_each do |num|
    puts num
end

p return_value # => [1, 2, 3]


# my_select
a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []


# my_reject
a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]


# my_any? / my_all?
a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true


# my_flatten
p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


# my_zip
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


# my_rotate
a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


# my_join
a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"


# my_reverse
p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]