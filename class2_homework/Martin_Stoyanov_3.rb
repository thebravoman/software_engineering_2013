require 'csv'

income=0.00
highest=0.00
date=''

CSV.foreach('bank.csv') do |row|
	income=row[1].to_f-row[2].to_f
	if income>highest
		highest=income
		date=row[0]
	end
end
puts date
