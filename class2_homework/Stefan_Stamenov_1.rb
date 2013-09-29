require 'csv'
require 'date'

deb=cre=bal=0.00

s = Date.strptime(ARGV[0],'%d/%m/%Y')
f = Date.strptime(ARGV[1],'%d/%m/%Y')

CSV.foreach("bank.csv") do |row|
	d = Date.strptime(row[0],'%d/%m/%Y')
	if d>=s and d<=f
	  deb=deb+row[1].to_f
	  cre=cre+row[2].to_f
	  bal=deb-cre
	end
end

printf "%.2f,%.2f,%.2f\n", deb, cre, bal
