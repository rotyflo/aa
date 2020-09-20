def my_reject(arr, &prc)
    rejected = []
    arr.each { |ele| rejected << ele if !prc.call(ele) }
    rejected
end

def my_one?(arr, &prc)
    only_one = false
    arr.each do |ele|
        if prc.call(ele)
            return false if only_one == true
            only_one = true
        end
    end
    only_one
end

def hash_select(hash, &prc)
    selected = {}
    hash.each { |k, v| selected[k] = v if prc.call(k, v) }
    selected
end

def xor_select(arr, prc1, prc2)
    selected = []
    arr.each { |ele| selected << ele if prc1.call(ele) ^ prc2.call(ele) }
    selected
end

def proc_count(val, procs)
    count = 0
    procs.each { |proc| count += 1 if proc.call(val) }
    count
end