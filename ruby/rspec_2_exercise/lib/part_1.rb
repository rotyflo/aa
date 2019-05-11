def partition(arr, num)
    new_arr = [[], []]
    
    arr.each do |el|
        if el < num
            new_arr[0] << el
        else
            new_arr[1] << el
        end
    end

    new_arr
end


def merge(hash_1, hash_2)
    new_hash = {}

    hash_2.each { |key, val| new_hash[key] = val }
    hash_1.each { |key, val| new_hash[key] = val if !new_hash.has_key?(key) }

    new_hash
end


def censor(sent, arr)
    vowels = "aeiou"
    words = sent.split

    words.each do |word|
        if arr.include?(word.downcase)
            word.downcase.each_char.with_index do |char, i|
                word[i] = "*" if vowels.include?(char)
            end
        end
    end

    words.join(" ")
end


def power_of_two?(num)
    n = num

    while n.even?
        n /= 2
    end

    return true if n == 1

    false
end