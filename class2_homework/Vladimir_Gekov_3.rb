require "CSV"

a=0
data=" "
CSV.foreach ("bank.csv") do |row| 
if row[1].to_f>a
a=row[1].to_f
data=row[0]
end
end
puts data
