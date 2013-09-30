require 'csv'
require 'date'

a = 0.00
b = 0.00
c = Date.strptime( ARGV[0],'%d/%m/%y')
d = Date.strptime( ARGV[1],'%d/%m/%y')

CSV.foreach("bank.csv") do |row|
	t = Date.strptime(row[0],'%d/%m/%y')
 	if t>= c and t<= d
  		a = a + row[1].to_f
  		b = b + row[2].to_f
 	end
end


printf "%.2f,%.2f,%.2f\n", a, b, a - b
