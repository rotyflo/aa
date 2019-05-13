def my_map(arr, &blc)
	new_arr = []

	arr.each { |el| new_arr << blc.call(el) }
	
	new_arr
end


def my_select(arr, &blc)
	new_arr = Array.new()

	arr.each { |el| new_arr << el if blc.call(el) }

	new_arr
end


def my_count(arr, &blc)
	count = 0

	arr.each { |el| count += 1 if blc.call(el) }

	count
end


def my_any?(arr, &blc)
	arr.each { |el| return true if blc.call(el) }

	false
end


def my_all?(arr, &blc)
	arr.each { |el| return false if !blc.call(el) }

	true
end


def my_none?(arr, &blc)
	arr.each { |el| return false if blc.call(el) }

	true
end