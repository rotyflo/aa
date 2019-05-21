class Array
	def my_each(&prc)
		i = 0

		while i < self.length
			prc.call(self[i])

			i += 1
		end

		self
	end

	def my_select(&prc)
		new_arr = []
		
		self.my_each { |el| new_arr << el if prc.call(el) }
		
		new_arr 
	end

	def my_reject(&prc)
		new_arr = []

		self.my_each { |el| new_arr << el if !prc.call(el) }

		new_arr
	end

	def my_any?(&prc)
		self.my_each { |el| return true if prc.call(el) }

		false
	end

	def my_all?(&prc)
		self.my_each { |el| return false if !prc.call(el) }

		true
	end

	def my_flatten
		flattened = []

		self.my_each do |el|
			if el.kind_of?(Array)
				flattened += el.my_flatten
			else
				flattened << el
			end
		end

		flattened
	end

	def my_zip(*arrs)
		zip = []
		i = 0

		while i < self.length
			subarr = [self[i]]

			arrs.my_each { |arr| subarr << arr[i] }

			zip << subarr

			i += 1
		end

		zip
	end

	def my_rotate(n=1)
		rot_arr = Array.new(self.length)
		i = 0

		while i < self.length
			rot_i = i - n % self.length

			rot_arr[rot_i] = self[i]

			i += 1
		end

		rotated_arr
	end

	def my_join(separator="")
		str = ""
		i = 0

		while i < self.length
			if i != self.length - 1
				str += self[i].to_s + separator
			else
				str += self[i].to_s
			end

			i += 1
		end

		str
	end

	def my_reverse
		reverse_arr = []
		i = -1

		while i >= -self.length
			reverse_arr << self[i]

			i -= 1
		end

		reverse_arr
	end
end