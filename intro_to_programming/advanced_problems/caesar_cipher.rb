# Feel free to use this variable:
# alphabet = "abcdefghijklmnopqrstuvwxyz"

def caesar_cipher(str, num)
  return str.split("").map { |char| encrypt(char, num) }.join("")
end

def encrypt(char, num)
  alpha = "abcdefghijklmnopqrstuvwxyz"

  return alpha[(alpha.index(char) + num) % 26]
end


puts caesar_cipher("apple", 1)    #=> "bqqmf"
puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
puts caesar_cipher("zebra", 4)    #=> "difve"
