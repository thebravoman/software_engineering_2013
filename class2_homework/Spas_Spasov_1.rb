require 'csv'
require 'date'
nachalo = Date.parse(ARGV[0])
krai = Date.parse(ARGV[1])
dohod = 0.00
razhod = 0.00
CSV.foreach("bank.csv") do |row|
	data = Date.parse(row[0])
	if data >= nachalo and data <= krai
		dohod = dohod + row[1].to_f
		razhod = razhod + row[2].to_f
	end
end
printf "%0.2f,%.2f,%.2f", dohod, razhod, dohod - razhod
