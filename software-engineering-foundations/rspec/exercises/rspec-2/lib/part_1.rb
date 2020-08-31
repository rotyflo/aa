def partition(arr, num)
    small, large = [], []
    arr.each { |ele| ele < num ? small << ele : large << ele }

    [small, large]
end


def merge(hash1, hash2)
    hash3 = hash1.merge(hash2)
end


def censor(sent, curse_words)
    words = sent.split
    words.map! do |word|
        if curse_words.include?(word.downcase)
            word.chars.map { |char| "aeiou".include?(char.downcase) ? "*" : char }.join
        else
            word
        end
    end

    words.join(" ")
end


def power_of_two?(num)
    i = 1

    while i < num
        i *= 2
    end

    i == num
end