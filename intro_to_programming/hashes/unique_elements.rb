# Hint: all keys of a hash are automatically unique

def unique_elements(arr)
  hash = {}

  arr.each { |element| hash[element] = true }

  return hash.keys
end

print unique_elements(['a', 'b', 'a', 'a', 'b', 'c']) #=> ["a", "b", "c"]
puts
