def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sent, &prc)
    words = sent.split
    words.map! { |word| prc.call(word) }
    words.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    [prc1.call(num), prc2.call(num)].max
end

def and_selector(arr, prc1, prc2)
    arr.select { |ele| prc1.call(ele) && prc2.call(ele) }
end

def alternating_mapper(arr, prc1, prc2)
    arr.map.with_index { |ele, i| i.even? ? prc1.call(ele) : prc2.call(ele) }
end