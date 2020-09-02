def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
    extensions = ['.com', '.net', '.io', '.org']
    urls.none? do |url|
        extensions.any? { |extension| url.include?(extension) }
    end
end

def any_passing_students?(students)
    students.any? do |student|
        grades = student[:grades]
        average = grades.sum / grades.length
        average >= 75
    end
end