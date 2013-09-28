require "csv"
require "date"

income = 0.00
expense = 0.00
if ARGV[0] != nil
	date1 =	Date.strptime(ARGV[0], '%d/%m/%y') 
	date2 =	Date.strptime(ARGV[1], '%d/%m/%y')
	CSV.foreach("bank.csv") do |row|
		currentdate = Date.strptime(row[0], '%d/%m/%y')
		if (currentdate >= date1 && currentdate <= date2)||(currentdate <= date1 && currentdate >= date2)
			income=income+row[1].to_f
			expense=expense+row[2].to_f
		
		end
	end
end
puts "#{income},#{expense},#{income-expense}"
#puts "%.2f,%.2f,%.2f\n", income, expense, income-expense

