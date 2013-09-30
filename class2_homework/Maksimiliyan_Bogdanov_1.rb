require 'csv'
require 'date'

date1 = Date.parse(ARGV[0], '%d/%m/%Y')
date2 = Date.parse(ARGV[1], '%d/%m/%Y')
prihod = 0.00
razhod = 0.00
  
  CSV.foreach("bank.csv") do |row|
	    if Date.parse(row[0]) >= date1 and Date.parse(row[0]) <= date2
		    prihod += row[1].to_f
	    	razhod += row[2].to_f
    	end
  end

printf "%.2f,%.2f,%.2f\n", prihod, razhod, prihod - razhod
