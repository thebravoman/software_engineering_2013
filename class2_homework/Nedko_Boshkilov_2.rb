require 'csv'
generated = 0.00
CSV.foreach('bank.csv') do |row|
	generated+=row[1].to_f
end
puts generated