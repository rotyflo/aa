def same_char_collapse(str)
  doubles_found = true

  while doubles_found
    doubles_found = false

    i = 0
    while i < str.length
      if str[i] == str[i + 1]
        str = str[0...i] + str[i + 2..-1]
        doubles_found = true
      end
      i += 1
    end
  end

  return str
end


puts same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy


puts same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv
