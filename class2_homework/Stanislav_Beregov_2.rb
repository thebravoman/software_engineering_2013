require 'csv'
require 'bigdecimal'

a = BigDecimal.new("0")
CSV.foreach 'bank.csv' do |line| 
	a += BigDecimal(line[1])
end
printf "%.2f", a