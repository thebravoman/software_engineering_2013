require "csv"
require "date"

first_day=Date.strptime(ARGV[0],'%d/%m/%Y' )
last_day=Date.strptime(ARGV[1], '%d/%m/%Y')



income = 0.00
expense = 0.00
bal=0.00
CSV.foreach("bank.csv") do |row|
		day = Date.strptime(row[0], '%d/%m/%Y')
	if day>=first_day && day <= last_day
		
		income=income+row[1].to_f
		expense=expense+row[2].to_f
	
	end
end


bal= income-expense


printf "%.2f,%.2f,%.2f", income, expense, bal
#puts expense
#puts income - expense
