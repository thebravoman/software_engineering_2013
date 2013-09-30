require 'csv'
require 'date'
require 'bigdecimal'

a = BigDecimal.new("0")
b = BigDecimal.new("0")
min = Date.strptime( ARGV[0], '%d/%m/%Y' )
max = Date.strptime( ARGV[1], '%d/%m/%Y' )

CSV.foreach 'bank.csv' do |line|
	curr = Date.strptime(line[0], '%d/%m/%Y')
	if min <= curr && curr <= max
		a += BigDecimal(line[1])
		b += BigDecimal(line[2])
	end
end
printf "%.2f,%.2f,%.2f", a, b, a-b
