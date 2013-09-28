require "csv"

day=Hash.new(0.0)

CSV.foreach("bank.csv") do |row|

day[row[0]]= day[row[0]] + row[1].to_f
end
puts (day.max_by{ |date,income| income })[0]