require "csv"

max_income = 0.00
date = "00/00/0000"

CSV.foreach("bank.csv") do |row|
    if row[1].to_f > max_income
    	max_income = row[1].to_f
    	date = row[0].to_s
    end
end

printf "%s", date
