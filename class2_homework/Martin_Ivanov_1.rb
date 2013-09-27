
require "csv"
require "date"

	start = DateTime.strptime(ARGV[0], '%d/%m/%Y') 
	finish = DateTime.strptime(ARGV[1], '%d/%m/%Y') 
        balance = 0.00
        incomes = 0.00
        expenses = 0.00


	CSV.foreach("bank.csv") do |row| 
		current = DateTime.strptime(row[0], '%d/%m/%Y') 

		if (current >= start) and (current <= finish) then 
				
				incomes += row[1].to_f
                                expenses += row[2].to_f
		
		end
	end

        balance = incomes-expenses

	printf "%.2f,%.2f,%.2f", incomes, expenses, balance
