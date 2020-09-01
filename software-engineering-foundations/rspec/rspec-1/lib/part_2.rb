def hipsterfy(word)
    last_index = nil

    word.each_char.with_index do |char, i|
        last_index = i if "aeiou".include?(char)
    end

    return word if last_index == nil

    word[0..last_index - 1] + word[last_index + 1..-1]
end


def vowel_counts(str)
    hash = Hash.new(0)

    str.each_char { |char| hash[char.downcase] += 1 }

    hash
end


def caesar_cipher(message, n)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    letters = message.split("")

    letters.map! do |char|
        alpha.include?(char) ? alpha[(alpha.index(char) + n) % 26] : char
    end

    letters.join
end