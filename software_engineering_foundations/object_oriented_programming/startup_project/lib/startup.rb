require "byebug"
require_relative "./employee"

class Startup
	attr_reader :name, :funding, :salaries, :employees

	def initialize(name, funding, salaries)
		@name = name
		@funding = funding
		@salaries = salaries
		@employees = []
	end

	def valid_title?(title)
		salaries.keys.include?(title)
	end

	def >(startup)
		@funding > startup.funding
	end

	def hire(employee_name, title)
		if valid_title?(title)
			@employees << Employee.new(employee_name, title)
		else
			raise "that isn't a job at this startup"
		end
	end

	def size
		@employees.length
	end

	def pay_employee(employee)
		salary = salaries[employee.title]

		if @funding >= salary
			employee.pay(salary)
			@funding -= salary
		else
			raise "we don't have enough in funding to pay that"
		end
	end

	def payday
		@employees.each { |employee| pay_employee(employee) }
	end

	def average_salary
		sum_of_sals = 0
		
		@employees.each do |employee|
			sum_of_sals += salaries[employee.title]
		end

		sum_of_sals / self.size
	end

	def close
		@employees = []
		@funding = 0
	end

	def acquire(startup)
		@funding += startup.funding

		@salaries.merge! startup.salaries.select { |title| !self.valid_title?(title) }

		@employees += startup.employees

		startup.close
	end
end
