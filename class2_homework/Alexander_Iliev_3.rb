require "csv"
income = 0.00
best_date = String
CSV.foreach("bank.csv")do|row|
	if income < row[1].to_f
		best_date = row[0]
		income = row[1].to_f
	end
end
printf "%s", best_date
