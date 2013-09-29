require "csv"
require "date"

date1=DateTime.strptime(ARGV[0], '%d/%m/%Y')
date2=DateTime.strptime(ARGV[1], '%d/%m/%Y')
       incomes=0.00
       expense=0.00
CSV.foreach("bank.csv") do |row|
	currentdate=DateTime.strptime(row[0], '%d/%m/%Y')
		if(current>=date1)and(current<=date2)
			income=income+row[1].to_f	
			expense=expense+row[2].to_f
		end
end
printf "%.2f,%.2f,%.2f",income,expense,income-expense
