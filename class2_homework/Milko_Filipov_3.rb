require 'csv'

r = 0.00
date = nil
max_date = nil

CSV.foreach('bank.csv') do |row|
	date = row[0]
	
	if  
		date == max_date
		r += row[1].to_f
		max_date = date
	
	elsif
		row[1].to_f > r
		r = row[1].to_f
		max_date = date
	end
end



puts max_date
