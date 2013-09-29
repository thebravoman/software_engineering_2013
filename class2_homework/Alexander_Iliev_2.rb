require "csv"
income = 0.00
CSV.foreach("bank.csv")do|row|
	income = income + row[1].to_f
end
printf "%.2f", income

