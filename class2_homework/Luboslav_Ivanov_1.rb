require "csv"

income = 0.00
expense = 0.00
total = 0.00
date1 = ARGV[0]
date2 = ARGV[1]

CSV.foreach("bank.csv") do |row|
if (date1 <= row[0]) && (row[0] <= date2)
	income=income+row[1].to_f
	expense=expense+row[2].to_f
end
end
total = income - expense

printf "%.2f,%.2f,%.2f",  income, expense, total	
