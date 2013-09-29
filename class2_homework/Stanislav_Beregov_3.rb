require 'csv'
require 'bigdecimal'

max  = BigDecimal.new("0")
last = BigDecimal.new("0")
lastdate = ""
maxdate = ""

CSV.foreach 'bank.csv' do |line|
	lastdate == line[0] ? last += BigDecimal(line[1]) : last = BigDecimal(line[1])
	if last > max
		max = last
		maxdate = line[0]
	end
	lastdate = line[0]
end
puts maxdate