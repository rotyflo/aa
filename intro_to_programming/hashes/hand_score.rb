def hand_score(hand)
  total = 0
  card_points = { "a" => 4, "k" => 3, "q" => 2, "j" => 1 }

  hand.each_char { |char| total += card_points[char.downcase] }

  return total
end

puts hand_score("AQAJ") #=> 11
puts hand_score("jJka") #=> 9
