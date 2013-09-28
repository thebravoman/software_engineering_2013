require "csv"
require "date"

first_date = Date.parse(ARGV[0])
second_date = Date.parse(ARGV[1])

income = 0.00
expense = 0.00

CSV.foreach("bank.csv") do |row|
	file_date = Date.parse(row[0])
	if file_date >= first_date && file_date <= second_date
		income=income+row[1].to_f
		expense=expense+row[2].to_f
	end
end

printf("%0.2f,%0.2f,%0.2f",income,expense,income - expense)
