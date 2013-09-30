require 'csv'

c=0.00
data=""
CSV.foreach("bank.csv") do |row|
   if data==row[0]
   c+=row[1].to_f
   else
   if row[1].to_f>c
   c=row[1].to_f
   data=row[0]
   end
   end
end
puts data
