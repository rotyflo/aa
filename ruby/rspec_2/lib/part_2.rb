def palindrome?(str)
    reverse = ""
    
    str.each_char { |char| reverse = char + reverse }

    str == reverse
end


def substrings(str)
    substrs = []
    
    (0...str.length).each do |i|
        (i...str.length).each { |j| substrs << str[i..j] }
    end

    substrs
end


def palindrome_substrings(str)
    substrings(str).select do |substr|
        substr if palindrome?(substr) && substr.length > 1
    end
end