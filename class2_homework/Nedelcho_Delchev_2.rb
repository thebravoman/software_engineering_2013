require 'csv'

bank_money = 0
CSV.foreach("bank.csv") do |row| 
	bank_money += row[1].to_f
end

print bank_money