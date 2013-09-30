require 'date'
date1 = Date.parse(ARGV[0])
date2 = Date.parse(ARGV[1])
require 'csv'
i = 0.00
o = 0.00
CSV.foreach("bank.csv") do |row|
    if Date.parse(row[0]) >= date1 && Date.parse(row[0]) <= date2
       i += row[1].to_f
	   o += row[2].to_f
    end
end
printf "%.2f,%.2f,%.2f", i, o, i-o
