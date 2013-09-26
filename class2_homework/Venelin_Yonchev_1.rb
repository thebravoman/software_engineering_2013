require 'csv'
require 'date'
i = 0.00
e = 0.00
beginn = Date.parse(ARGV[0])
endd = Date.parse(ARGV[1])
CSV.foreach('bank.csv') do |row|
	x = Date.strptime( row[0], '%d/%m/%Y' )
	if x >= beginn and x <= endd
		i += row[1].to_f
		e += row[2].to_f
	end
end
bal = i-e
printf "%.2f,%.2f,%.2f",i,e,bal