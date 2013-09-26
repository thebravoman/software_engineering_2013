require 'csv'
require 'date'
dates = Array.new
incomes = Array.new
i = 0
CSV.foreach("bank.csv") do |row|
	if dates.include?(row[0]) == true
		incomes[dates.index(row[0])] += row[1].to_f
	else
		dates[i] = row[0]
		incomes[i] = row[1].to_f
		i += 1
	end
end
puts dates[incomes.index(incomes.max)]