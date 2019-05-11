def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end


def average_array(numbers)
    numbers.sum / (numbers.length * 1.0)
end


def repeat(str, num)
    str * num
end


def yell(str)
    str.upcase + "!"
end


def alternating_case(sentence)
    words = []

    sentence.split(" ").each_with_index do |word, i|
        if i.even?
            words << word.upcase
        else
            words << word.downcase
        end
    end

    words.join(" ")
end