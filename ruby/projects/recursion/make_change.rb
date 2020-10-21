def greedy_make_change(amount, coins = [25, 10, 5, 1])
	return [] if amount < 1

	coins.sort!.select! { |coin| amount >= coin }
	[coins.last] + greedy_make_change(amount - coins.last, coins)
end

p greedy_make_change(120) # [25, 25, 25, 25, 10, 10]
p greedy_make_change(99) # [25, 25, 25, 10, 10, 1, 1, 1, 1]

# Compare every combination of change
def make_better_change(amount, coins = [25, 10, 5, 1])
	return [] if amount < 1
	smallest_change = nil

	coins.sort.reverse.each.with_index do |coin, i|
		unless coin > amount
			change = [coin] + make_better_change(amount - coin, coins.drop(i))
			if smallest_change == nil || change.count < smallest_change.count
				smallest_change = change
			end
		end
	end

	smallest_change
end

p greedy_make_change(24, [10, 7, 1]) # [10, 10, 1, 1, 1, 1]
p make_better_change(24, [10, 7, 1]) # [10, 7, 7]
