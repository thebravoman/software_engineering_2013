filename = 'bank.csv'

require 'csv'

money = 0
CSV.foreach(filename) do |row|
	money += row[1].to_f
end

puts money
