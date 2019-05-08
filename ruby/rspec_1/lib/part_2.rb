def hipsterfy(word)
    vowels = "aeiou"
    last_vowel_i = -1

    word.each_char.with_index { |char, i| last_vowel_i = i if vowels.include?(char) }

    return word if last_vowel_i == -1

    word[0...last_vowel_i] + word[last_vowel_i + 1..-1]
end


def vowel_counts(str)
    vowels = "aeiou"
    count = Hash.new(0)

    str.downcase.each_char { |char| count[char] += 1 if vowels.include?(char) }

    count
end


def caesar_cipher(message, n)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    cipher = ""

    message.each_char do |char|
        if alpha.include?(char)
            cipher += alpha[(alpha.index(char) + n) % 26]
        else
            cipher += char
        end
    end

    cipher
end