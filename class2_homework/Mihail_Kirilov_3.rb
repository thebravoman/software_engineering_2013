require "csv"

current_income = 0.00
max_income = 0.00
date_of_max_income = ''
yesterday = 0
CSV.foreach("bank.csv") do |row|
	
	if yesterday != row[0].to_i
		current_income = 0.00
		yesterday = row[0].to_i
	end
	
	current_income += row[1].to_f - row[2].to_f
	
	if current_income > max_income
		max_income = current_income
		date_of_max_income = row[0].to_s
	end
end
puts date_of_max_income
