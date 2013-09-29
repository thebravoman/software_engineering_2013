require 'csv'

current_balance = 0.00
max_balance = 0.00
searched_date = ' '

CSV.foreach("bank.csv") do |row|
	current_balance = row[1].to_f - row[2].to_f
	if current_balance > max_balance
		searched_date = row[0]
		max_balance = current_balance
	end
end

puts searched_date
