require 'csv'
h = Hash.new(0.0)
 CSV.foreach("bank.csv") do |row|
     h[row[0]] = h[row[0]] + row[1].to_f
 end
puts (h.max_by{ |d,o| o})[0]