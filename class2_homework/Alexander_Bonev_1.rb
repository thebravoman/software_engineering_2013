require 'csv'
require 'date'

date1 = Date.parse(ARGV[0])
date2 = Date.parse(ARGV[1])
bucks = 0.00
spent = 0.00


CSV.foreach('bank.csv') do |line|
datec = Date.parse(line[0])
if datec >= date1 && datec <= date2
	bucks = bucks + line[1].to_f
	spent = spent + line[2].to_f
	
end
end
printf "%0.2f,%0.2f,%0.2f", bucks, spent, bucks-spent