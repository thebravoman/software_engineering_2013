require 'csv'

m1_bank = 0.0

CSV.foreach('bank.csv') do |row|
	 m1_bank = m1_bank + row[1].to_f
end

printf "%0.2f", m1_bank
