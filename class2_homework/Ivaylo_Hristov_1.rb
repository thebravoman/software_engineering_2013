require 'csv'
require 'date'
startd = Date.parse(ARGV[0])
endd = Date.parse(ARGV[1])
inc = 0.00
exp = 0.00
CSV.foreach("bank.csv") do |row|
	d = Date.parse(row[0])
	if d >= startd and d <= endd
		inc += row[1].to_f
		exp += row[2].to_f
	end
end
puts inc,exp,inc-exp