#/usr/bin/ruby

require 'csv'

result = File.new('bank_result.csv', 'w')

all = []
debit = gets

CSV.foreach('bank.csv') do |row|
	if row[2].to_f != nil
		if row[2].to_f > debit.to_f 
			all << [row[2]]
		end
	end
end

result.puts(all.sort.reverse)

