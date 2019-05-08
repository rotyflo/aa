# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
    peaks = []

    arr.each_with_index do |el, i|
        if el == arr.first && el > arr[i + 1]
            peaks << el
        elsif el == arr.last && el > arr[i - 1]
            peaks << el
        elsif el > arr[i - 1] && el > arr[i + 1]
            peaks << el
        end
    end

    peaks
end


p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
