require "csv"
require "date"

max = 0.00
date = nil
	CSV.foreach("bank.csv") do |row|
		if(row[1].to_f > max)
			max = row[1].to_f
			date = row[0]
		end
	end
puts date
