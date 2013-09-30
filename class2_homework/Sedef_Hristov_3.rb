require "csv"

inc =0.00
 dt =''
CSV.foreach("bank.csv") do |row|

if  inc < row[1].to_f
inc = row[1].to_f
dt = row[0]

end
end

puts dt 
