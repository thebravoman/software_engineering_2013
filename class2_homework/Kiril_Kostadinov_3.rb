require "csv"

max = 0.00
max_date = ''
prev_date = ''
income = 0.00
CSV.foreach("bank.csv") do |row|
	row[1] = row[1].to_f
	if prev_date == row[0]
		income += row[1]
		prev_date = row[0]
		next 
	elsif income > max
		max = income
		max_date = prev_date
		income = 0.00
	end
	if row[1] > max
		max = row[1]
		max_date = row[0]
	end
	prev_date = row[0]
end
puts max_date
