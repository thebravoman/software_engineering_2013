 #!/usr/bin/ruby

require 'csv'
require 'date'

ds1 = Date.strptime( ARGV[0], '%d/%m/%Y' )
de2 = Date.strptime( ARGV[1], '%d/%m/%Y' )

prix = 0.00
razx = 0.00
bal = 0.00

CSV.foreach("bank.csv") do |row|
  atmdate = Date.strptime( row[0], '%d/%m/%Y' )
	if atmdate >= ds1 && atmdate <= de2
		prix += row[1].to_f
		razx += row[2].to_f
	end
end

bal = prix - razx 

printf "%.2f,%.2f,%.2f", prix, razx, bal
