	require "csv"

income = 0.00
expense = 0.00
max = 0.00

CSV.foreach("bank.csv") do |row|
	if (row[1].to_f > max.to_f )
		max = row[1].to_f
	end
	
end

CSV.foreach("bank.csv") do |row|
	if row[1].to_f == max
		puts row[0]
	end
	
end

