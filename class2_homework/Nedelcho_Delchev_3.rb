require 'csv'
require 'date'

income = 0.00
date = ""

CSV.foreach("bank.csv") do |row|
	if income < row[1].to_f
		income = row[1].to_f
		date = row[0]
	end
end

printf date