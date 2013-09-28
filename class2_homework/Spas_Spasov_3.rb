require "csv"

pin=Hash.new(0.0)
CSV.foreach("bank.csv") do |row|
	pin[row[0]]= pin[row[0]] + row[1].to_f
end
puts (pin.max_by{ |data,dohod| dohod })[0]
