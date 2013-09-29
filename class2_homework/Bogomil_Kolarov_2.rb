require "csv"

max = 0.00
	CSV.foreach("bank.csv") do |row| 
			max += row[1].to_f
	end
printf "%.2f\n", max
