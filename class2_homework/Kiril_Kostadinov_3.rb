require "csv"

max = 0.00
max_date = ''
CSV.foreach("bank.csv") do |row|
	row[1] = row[1].to_f
	if row[1] > max
		max = row[1]
		max_date = row[0]
	end
end
puts max_date
# Why does the readme say that the correct answer is 03/10/13 when 13/10/13 has a higher income (105.00 compared to 103.00)?