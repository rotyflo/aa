def select_even_nums(nums)
    nums.select(&:even?)
end


def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] < 3 }
end


def count_positive_subarrays(arr)
    arr.count { |subarr| subarr.sum > 0 }
end


def aba_translate(word)
    chars = word.split("")
    chars.map! { |char| "aeiou".include?(char) ? char + "b" + char : char }
    chars.join
end


def aba_array(words)
    words.map { |word| aba_translate(word) }
end