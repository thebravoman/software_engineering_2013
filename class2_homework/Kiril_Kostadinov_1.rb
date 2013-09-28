require "csv"
require "date"

income = 0.00
expense = 0.00
min = Date.strptime(ARGV[0], '%d/%m/%Y')
max = Date.strptime(ARGV[1], '%d/%m/%Y')
CSV.foreach("bank.csv") do |row|
	d = Date.strptime(row[0], '%d/%m/%Y')
	if d >= min && d <= max
		income=income+row[1].to_f
		expense=expense+row[2].to_f
	end
end
printf "%.2f,%.2f,%.2f\n", income, expense, income - expense