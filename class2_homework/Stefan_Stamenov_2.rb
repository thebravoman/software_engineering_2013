require 'csv'

m1=0.0


CSV.foreach("bank.csv") do |r|
	m1+=r[1].to_f
end
puts m1
