require 'csv'
require 'date'
income=0
income2=0
currentdate2=Date.new(0,1,1)
maxdate=Date.new(0,1,1)
CSV.foreach('bank.csv') do |row|
	currentdate=Date.strptime(row[0],'%d/%m/%y')
	if (currentdate!=currentdate2)
		if(income>income2)
			income2=income
			income=0
			maxdate=currentdate2
		end
		income+=row[1].to_f
		currentdate2=currentdate
	end
	if(income>income2)
			income2=income
			income=0
			maxdate=currentdate2
	end
end
puts maxdate