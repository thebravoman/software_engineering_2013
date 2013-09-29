require "csv"

max_income = 0.00
date_of_max_income = 0

CSV.foreach("bank.csv") do |row|
	if row[1].to_f > max_income
		max_income = row[1].to_f
		date_of_max_income = row[0]
	end	
end

puts date_of_max_income