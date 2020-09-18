def no_dupes?(arr)
    counts = Hash.new(0)
    arr.each { |ele| counts[ele] += 1 }
    counts.select! { |k, v| v == 1 }
    counts.keys
end

# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each { |i| return false if arr[i] == arr[i + 1] }
    true 
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    indices = Hash.new([])
    str.each_char.with_index { |char, i| indices[char] += [i] }
    indices
end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    last_char = ''
    streak = 1
    longest = ''
    str.each_char.with_index do |char, i|
        last_char == char ? streak += 1 : streak = 1
        longest = str[i + 1 - streak..i] if streak >= longest.length
        last_char = char
    end
    longest
end

# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    primes = list_primes_until(num)
    primes.any? { |x| primes.any? { |y| x * y == num } }
end

def list_primes_until(num)
    (1..num).select(&:prime?)
end

class Integer
    def prime?
        return false if self < 0
        (2...self).none? { |factor| self % factor == 0 }
    end
end

# Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    chars = message.split('')
    i = -1
    enc_chars = chars.map do |char|
        i = (i + 1) % keys.length
        encrypt_char(char, keys[i])
    end
    enc_chars.join
end

def encrypt_char(char, key)
    code = char.ord
    enc_code = code + key
    enc_code -= 26 if enc_code > 122
    enc_code.chr
end

# Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowel_indices = (0...str.length).select { |i| 'aeiou'.include?(str[i]) }
    rotated_indices = vowel_indices.rotate(-1)
    rotated_chars = str.split('').map.with_index do |char, i|
        vowel_indices.include?(i) ? str[rotated_indices.shift] : char
    end
    rotated_chars.join
end

# Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

