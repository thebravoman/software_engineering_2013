require 'csv'
require 'date'
dates = Array.new
incomes = Array.new
i = 0
CSV.foreach("bank.csv") do |row|
	if dates.include? Date.parse(row[0]) == true
		incomes[i] += row[1].to_f
	else
		dates[i] = row[0]
		incomes[i] =+ row[1].to_f
	end
	i += 1
end
puts dates[incomes.index(incomes.max)]
