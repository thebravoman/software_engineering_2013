require "csv"

current_income = 0.00
max_income = 0.00
the_date = 0.00
date_of_max_income = ""

CSV.foreach("bank.csv") do |row|
	if date_of_max_income != row[0].to_s
		current_income = 0.00
		date_of_max_income = row[0].to_s
	end
	current_income = current_income + row[1].to_f - row[2].to_f
	if current_income > max_income
		max_income = current_income
		date_of_max_income = row[0]
	end
end
puts date_of_max_income

