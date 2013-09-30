require 'csv'
require 'date'

a = 0.00
date = nil
theday = nil

CSV.foreach('bank.csv') do |row|
	date = row[0]

	if date == theday
		a = a + row[1].to_f
		theday = date

	elsif
		row[1].to_f > a
		a =  row[1].to_f
		theday = date
	end
end



puts theday
