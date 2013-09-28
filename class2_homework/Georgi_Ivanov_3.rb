require "csv"

max_income = 0
date = nil
CSV.foreach("bank.csv") do |row|
	holder = row[1].to_f
	if(holder > max_income)
		max_income = holder
		date = row[0]
	end
end

print date