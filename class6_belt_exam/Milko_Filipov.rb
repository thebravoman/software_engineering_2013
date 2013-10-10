require 'csv'

debit = []

CSV.foreach("bank.csv") do |row|
	if row[2].to_i > ARGV[0].to_i
		debit << row
	end
end

debit = debit.sort
debit = debit.reverse

CSV.open("bank_result", "w") do |csv|
	debit.each do |element|
		csv << element
	end
end
