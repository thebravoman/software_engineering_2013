require 'csv'
require 'date'

i1 = Date.strptime( ARGV[0], '%d/%m/%Y' )
i2 = Date.strptime( ARGV[1], '%d/%m/%Y' )
credit = 0.0
debit = 0.0
CSV.foreach('bankDSK.csv') do |r|
	next if r.empty?
	t = Date.strptime( r[0], '%d/%m/%Y' )
	if t >= i1 && t <= i2
		debit += r[1].to_f
		credit += r[2].to_f
	end
end
printf "%.2f,%.2f,%.2f\n", debit, credit, debit - credit 
