require 'csv'

m1 = 0.00
CSV.foreach('bank.csv') do |row|
	m1 = m1 + row[1].to_f
end

puts "%0.2f" m1