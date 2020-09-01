def palindrome?(str)
    reverse_str = ""

    (0...str.length).each { |i| reverse_str = str[i] + reverse_str }

    reverse_str == str
end


def substrings(str)
    substrings = []

    (0..str.length).each do |i|
        (i + 1..str.length).each { |j| substrings << str[i...j] }
    end

    substrings
end


def palindrome_substrings(str)
    substrings(str).select { |sub_str| palindrome?(sub_str) && sub_str.length > 1 }
end