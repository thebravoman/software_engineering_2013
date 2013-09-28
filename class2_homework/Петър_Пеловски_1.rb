require "csv"

income = 0.00
expense = 0.00
balance = 0.00
broqch = 0
CSV.foreach("text_file.csv") do |row|
	if row[0] == ARGV[0]
		broqch = 1
	end
	if broqch == 1
		income=income+row[1].to_f
		expense=expense+row[2].to_f
	end
	if row[0] == ARGV[1]
		broqch = 0
	end
end
balance = income - expense
printf "#{income.to_f} #{expense.to_f} #{balance.to_f}"
