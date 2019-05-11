# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    new_str = ""
    amount = 1
    
    str.each_char.with_index do |char, i|
        if i == str.length - 1
            new_str += format_chars(char, amount)
        elsif char == str[i + 1]
            amount += 1
        else
            new_str += format_chars(char, amount)

            amount = 1
        end
    end

    new_str
end

def format_chars(char, amount)
    if amount > 1
        amount.to_s + char
    else
        char
    end
end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
