require 'csv'

x=0.00
y=0.00

CSV.foreach("bank.csv") do |row|
   if(row[0].to_i>=ARGV[0].to_i) && (row[0].to_i<=ARGV[1].to_i)
   x=x+row[1].to_f
   y=y+row[2].to_f
   end
end
printf "%.2f,%.2f,%.2f\n",x,y,x-y
