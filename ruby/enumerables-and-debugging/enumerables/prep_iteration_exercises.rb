# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
  (1..num).select { |factor| num % factor == 0 }
end

# tests
# p factors(0)  # []
# p factors(4)  # [1, 2, 4]
# p factors(9)  # [1, 3, 9]
# p factors(23) # [1, 23]

# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
  def bubble_sort!(&prc)
    (0...self.length).each do |i|
      (i...self.length).each do |j|
        if prc.call(self[i], self[j]) == 1
          self[i], self[j] = self[j], self[i]
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    sorted = Array.new(self)
    (0...self.length).each do |i|
      (i...self.length).each do |j|
        if prc.call(sorted[i], sorted[j]) == 1
          sorted[i], sorted[j] = sorted[j], sorted[i]
        end
      end
    end
    sorted
  end
end

# tests
# unsorted_array = [5, 1, 4, 2, 3]
# p unsorted_array.bubble_sort { |num1, num2| num1 <=> num2 } # [1, 2, 3, 4, 5]
# p unsorted_array  # [5, 1, 4, 2, 3]
# p unsorted_array.bubble_sort! { |num1, num2| num2 <=> num1 } # [5, 4, 3, 2, 1]
# p unsorted_array  # [5, 4, 3, 2, 1]

# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
  substrings = []
  (0...string.length).each do |i|
    (i...string.length).each do |j|
      substrings << string[i..j]
    end
  end
  substrings
end

def subwords(word, dictionary)
  substrings(word).select do |substring|
    dictionary.include?(substring)
  end
end

# tests
# p substrings("a") # ["a"]
# p substrings("cat") # ["c", "ca", "cat", "a", "at", "t"]
# p subwords("cat", ["cat", "dog", "and", "at", "a"]) # ["cat", "a", "at"]

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
  array.map { |ele| ele * 2 }
end

# tests
# p doubler([1, 2, 3])  # [2, 4, 6]
# p doubler([0])  # [0]
# p doubler([-2, -4, -8]) #[-4, -8, -16]

# ### My Each
# Extend the Array class to include a method named `my_each` that takes a
# block, calls the block on every element of the array, and then returns
# the original array. Do not use Enumerable's `each` method. I want to be
# able to write:
#

class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
end

# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# p return_value # => [1, 2, 3]

# ### My Enumerable Methods
# * Implement new `Array` methods `my_map` and `my_select`. Do
#   it by monkey-patching the `Array` class. Don't use any of the
#   original versions when writing these. Use your `my_each` method to
#   define the others. Remember that `each`/`map`/`select` do not modify
#   the original array.
# * Implement a `my_inject` method. Your version shouldn't take an
#   optional starting argument; just use the first element. Ruby's
#   `inject` is fancy (you can write `[1, 2, 3].inject(:+)` to shorten
#   up `[1, 2, 3].inject { |sum, num| sum + num }`), but do the block
#   (and not the symbol) version. Again, use your `my_each` to define
#   `my_inject`. Again, do not modify the original array.

class Array
  def my_map(&prc)
    mapped = []
    self.my_each do |ele|
      mapped << prc.call(ele)
    end
    mapped
  end

  def my_select(&prc)
    selected = []
    self.my_each do |ele|
      selected << ele if prc.call(ele)
    end
    selected
  end

  def my_inject(&blk)
    accumulated = self[0]
    self[1..-1].my_each do |ele|
      accumulated = blk.call(accumulated, ele)
    end
    accumulated
  end
end

# p [1, 2, 3].my_map { |ele| ele * 3 }  # [3, 6, 9]
# p [1, 2, 3].my_select(&:odd?) # [1, 3]
# p [1, 2, 3].my_inject { |acc, num| acc + num }  # 6
# p [1, 2, 3].my_inject { |acc, num| acc * num }  # 6
# p [1, 2, 3].my_inject { |acc, num| acc - num }  # -4
# p [1, 2].my_inject { |sum, num| sum + num } # 3
# p [1].my_inject { |sum, num| sum + num }  # 1

# ### Concatenate
# Create a method that takes in an `Array` of `String`s and uses `inject`
# to return the concatenation of the strings.

def concatenate(strings)
  strings.my_inject { |string, part| string + part }
end

# p concatenate(["Yay ", "for ", "strings!"]) # => "Yay for strings!"