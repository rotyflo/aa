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

def xor_select(arr, &prc)

end

def proc_count(val, arr)

end