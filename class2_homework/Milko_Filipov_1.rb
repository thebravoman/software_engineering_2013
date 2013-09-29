require 'csv'
require 'date'

d1 = Date.strptime( ARGV[0], '%d/%m/%Y' )
d2 = Date.strptime( ARGV[1], '%d/%m/%Y' )

prihod = 0.00
razhod = 0.00



CSV.foreach("bank.csv") do |row|
	time = Date.strptime( row[0], '%d/%m/%Y' )
	if time >= d1 and time <= d2
		prihod += row[1].to_f
		razhod += row[2].to_f
	end
end




printf "%.2f,%.2f,%.2f", prihod, razhod, prihod - razhod
