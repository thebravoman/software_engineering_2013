require 'csv'

income = 0.00
outcome = 0.00
within_diapason = false

CSV.foreach("bank.csv") do |row|
	if row[0] == ARGV[0]
		within_diapason = true
	elsif row[0] == ARGV[1]
		income += row[1].to_f
		outcome += row[2].to_f
		within_diapason = false
	end
	if within_diapason == true
		income += row[1].to_f
		outcome += row[2].to_f
	end
end

printf "%.2f, %.2f, %.2f", income, outcome, income - outcome
