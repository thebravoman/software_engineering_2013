require "csv"
require "date"

income = 0.00
expense = 0.00
if ARGV[0] != nil
	date1 = Date.strptime(ARGV[0],'%d/%m/%Y')
	date2 = Date.strptime(ARGV[1],'%d/%m/%Y')
	CSV.foreach('bank.csv') do |row|
		next if row.empty?
		date3 = Date.strptime(row[0],'%d/%m/%Y')
		if(date3>=date1 && date3<=date2)||(date3<=date1 && date3>=date2)
		        income = income + row[1].to_f
			expense = expense + row[2].to_f
		end
	end
printf "%.2f,%.2f,%.2f\n", income, expense, income-expense
end
