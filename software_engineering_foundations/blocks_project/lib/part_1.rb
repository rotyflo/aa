def select_even_nums(nums)
    nums.select(&:even?)
end


def reject_puppies(puppies)
    puppies.reject { | puppy | puppy["age"] <= 2 }
end


def count_positive_subarrays(arr)
    arr.count { | subarr | subarr.sum > 0 }
end


def aba_translate(str)
    i = 0

    while i < str.length
        char = str[i]

        if "aeiou".include?(char)
            str.insert(i + 1, "b" + char)
            i += 3
        else
            i += 1
        end
    end

    str
end


def aba_array(words)
    words.map { |word| aba_translate(word) }
end