require "csv"
require "date"
from_date = Date.strptime(ARGV[0], '%d/%m/%Y')
to_date = Date.strptime(ARGV[1], '%d/%m/%Y')
income = 0.00
expense = 0.00
CSV.foreach("bank.csv")do|row|
	date = Date.strptime(row[0], '%d/%m/%Y')
	if (date >= from_date) && (date <= to_date)
		income = income + row[1].to_f
		expense = expense + row[2].to_f
	end
end
printf "%.2f,%.2f,%.2f",income,expense,income - expense
