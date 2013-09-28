require 'csv'

m=0.00

CSV.foreach("bank.csv") do |row|
m+=row[1].to_f
end
puts m
