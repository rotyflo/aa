def average(num1, num2)
    (num1 + num2) / 2.0
end


def average_array(arr)
    arr.sum / (arr.length * 1.0)
end


def repeat(str, num)
    str * num
end


def yell(str)
    str.upcase + "!"
end


def alternating_case(sentence)
    words = sentence.split

    words.map!.with_index { |word, i| i.even? ? word.upcase : word.downcase }

    words.join(" ")
end