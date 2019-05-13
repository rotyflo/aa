def reverser(str, &blc)
    blc.call(str.reverse)
end


def word_changer(str, &blc)
    (str.split.map { |word| blc.call(word) }).join(" ")
end


def greater_proc_value(num, proc_1, proc_2)
    [proc_1.call(num), proc_2.call(num)].max
end


def and_selector(arr, proc_1, proc_2)
    arr.select { |el| proc_1.call(el) && proc_2.call(el) }
end


def alternating_mapper(arr, proc_1, proc_2)
    arr.map.with_index do |el, i|
        if i.even? then proc_1.call(el) else proc_2.call(el) end
    end
end