require "csv"
require "date"
	
	lower_date = Date.strptime(ARGV[0], '%d/%m/%Y')
	upper_date = Date.strptime(ARGV[1], '%d/%m/%Y')
	income = 0.0
	expense = 0.0

CSV.foreach("bank.csv") do |row|
	todays_date = Date.strptime(row[0], '%d/%m/%Y')
	if todays_date >= lower_date
		if todays_date <= upper_date 
			income += row[1].to_f
			expense += row[2].to_f
		end
	end
end
	
printf "%.2f, %.2f, %.2f\n", income, expense, income-expense