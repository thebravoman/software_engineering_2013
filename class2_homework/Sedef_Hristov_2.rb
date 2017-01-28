require "csv"

m1b= 0.00

CSV.foreach("bank.csv") do |row|
m1b = m1b + row[1].to_f

end

puts m1b
