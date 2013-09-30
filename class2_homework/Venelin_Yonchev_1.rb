require 'csv'
require 'date'
y = Date.strptime( ARGV[0], '%d/%m/%Y' )
z = Date.strptime( ARGV[1], '%d/%m/%Y' )
i = 0.00
e = 0.00
CSV.foreach("bank.csv") do |row|
	x = Date.strptime(row[0], '%d/%m/%Y' )
	if x >= y and x <= z
		i += row[1].to_f
		e += row[2].to_f
	end
end
bal = i-e
printf "%.2f,%.2f,%.2f", i, e, bal