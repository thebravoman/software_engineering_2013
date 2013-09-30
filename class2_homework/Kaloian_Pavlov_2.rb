vspari=0.00
require 'csv'

CSV.foreach('bank.csv') do |row|
	vspari = vspari + row[1].to_f
end

puts vspari
