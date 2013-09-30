require "csv"

h = 0.00
CSV.foreach("bank.csv") do |row|
	h = h + row[1].to_f
end
printf("%d",h)
