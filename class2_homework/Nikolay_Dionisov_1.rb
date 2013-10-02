filename = 'bank.csv'
date1 = ARGV[0]
date2 = ARGV[1]

require 'csv'
require 'date'

income = 0
outcome = 0
date1 = Date.parse(date1);
date2 = Date.parse(date2);
CSV.foreach(filename) do |row|
	date = Date.parse(row[0])
	if date >= date1 and date <= date2 then
		income+=row[1].to_f
		outcome+=row[2].to_f
	end
end
printf "%.2f,%.2f,%.2f\n", income, outcome, income-outcome
