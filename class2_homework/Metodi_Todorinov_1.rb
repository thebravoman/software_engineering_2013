require "csv"
require "date"


date1 = Date.parse(ARGV[0], '%d/%m/%y')
date2 = Date.parse(ARGV[1], '%d/%m/%y')
prh = 0.00
rzh = 0.00


   CSV.foreach("bank.csv") do |row|
      m = Date.parse(row[0])
      if m >= date1 and m <= date2
              prh += row[1].to_f
 	      rzh += row[2].to_f
       end

end
printf "%.2f,%.2f,%2.f", prh, rzh, prh-rzh 
