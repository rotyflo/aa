def greedy_make_change(amount, coins = [25, 10, 5, 1])
	return [] if amount < 1

	coins.sort!.select! { |coin| amount >= coin }
	[coins.last] + greedy_make_change(amount - coins.last, coins)
end

p greedy_make_change(120)
p greedy_make_change(99)
p greedy_make_change(24)
p greedy_make_change(0)
