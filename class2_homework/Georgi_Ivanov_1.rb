require "csv"
require "date"

income = 0.00
expense = 0.00
first_date = Date.strptime(ARGV[0], '%d/%m/%Y')
last_date = Date.strptime(ARGV[1], '%d/%m/%Y')

CSV.foreach("bank.csv") do |row|
	date = Date.strptime(row[0], '%d/%m/%Y')
	if((date >= first_date)&&(date <= last_date))
		income += row[1].to_f
		expense += row[2].to_f
	end
end

printf "%.2f,%.2f,%.2f\n", income, expense, income-expense
