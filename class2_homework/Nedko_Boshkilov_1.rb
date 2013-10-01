require 'csv'
require 'date'
initdate=Date.strptime(ARGV[0], '%d/%m/%y')
finaldate=Date.strptime(ARGV[1], '%d/%m/%y')
income=0.00
outcome=0.00
CSV.foreach('bank.csv') do |row|
	currentdate=Date.strptime(row[0], '%d/%m/%y')
	if((currentdate>=initdate)&&(currentdate<=finaldate))
		income+=row[1].to_f
		outcome+=row[2].to_f
	end
end
puts income
puts','
puts outcome
puts','
puts income-outcome