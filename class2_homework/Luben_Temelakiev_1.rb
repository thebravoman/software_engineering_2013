require 'csv'
require 'date'

nachalo = Date.parse(ARGV[0], '%d/%m/%Y')
krai = Date.parse(ARGV[1], '%d/%m/%Y')
prihod = 0.00
razhod = 0.00

CSV.foreach("bank.csv") do |row|
	if Date.parse(row[0]) >= nachalo and Date.parse(row[0]) <= krai
		prihod += row[1].to_f
		razhod += row[2].to_f
	end
end

printf "%.2f,%.2f,%.2f\n", prihod, razhod, prihod-razhod
