require "csv"
require "date"

income = 0.00
expense = 0.00
begin_date = Date.strptime(ARGV[0], '%d/%m/%Y')
end_date = Date.strptime(ARGV[1], '%d/%m/%Y')

CSV.foreach("Bank.csv") do |row|
	current_date = DateTime.strptime(row[0], '%d/%m/%Y') 
    if (current_date >= begin_date) && (current_date <= end_date)
        income=income+row[1].to_f
        expense=expense+row[2].to_f
    end
end
balance = income-expense
printf "%.2f, %.2f, %.2f", income, expense, balance
