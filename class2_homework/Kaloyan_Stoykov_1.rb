require 'csv'
require 'date'

income = 0.00
expence = 0.00
balance = 0.00

fdata = Date.strptime(ARGV[0],'%d/%m/%Y')
ldata = Date.strptime(ARGV[1],'%d/%m/%Y')

CSV.foreach("bank.csv") do |row|
	impdata = Date.strptime( row[0],'%d/%m/%Y')
	if impdata >= fdata && impdata <= ldata
		income = income + row[1].to_f
		expence = expence + row[2].to_f
	end
end
balance = income - expence
printf "%0.2f,%0.2f,%0.2f", income,expence,balance

