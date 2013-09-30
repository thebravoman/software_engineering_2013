#!/usr/bin/ruby

require 'csv'
require 'date'

start = Date.strptime(ARGV[0],'%d/%m/%Y')
finish = Date.strptime(ARGV[1],'%d/%m/%Y')

debit = 0.0
credit = 0.0

CSV.foreach('bank.csv') do |row|
	if Date.strptime(row[0],'%d/%m/%Y') >= start
		if Date.strptime(row[0],'%d/%m/%Y') <= finish
			debit += row[1].to_f
			credit += row[2].to_f
		end
	end

end

printf "%.2f,%.2f,%.2f\n", debit, credit, debit-credit
