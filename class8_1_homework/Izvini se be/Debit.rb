require 'csv'

values_debit = Hash.new()
CSV.foreach("bank.csv") do |row|
	month = row[1].split("/")[1]
	if month == ARGV[0]
		value = row[4].split(" ")[0]
		if row[2] != nil
			values_debit[value] = values_debit[value].to_i + row[2].to_i
		else
			values_debit[value] = values_debit[value].to_i + 0
		end
	end
end

values_debit = values_debit.sort_by { |a, b| b.to_i }

CSV.open("month_results.csv", "w") do |csv|
	values_debit.each do |value, debit|
		csv << [value,debit]
	end
end
