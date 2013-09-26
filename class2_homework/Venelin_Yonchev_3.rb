require 'csv'
require 'date'
m = 0.00
d = "test"
a = Array.new
CSV.foreach("bank.csv") do |row|
	if row[1].to_f > m
		m = row[1].to_f
	end
end

CSV.foreach("bank.csv") do |row|
	if row[1].to_f == m
		d = row[0].to_s
		a.push(d)
	end
end
puts a