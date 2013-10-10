require 'csv'

debit = Hash.new("")

CSV.foreach(ARGV[0]) do |row|
	if row[3].nil?
		debit[row[0]] = row
	end
end

CSV.open(ARGV[0] + "results.csv", "w") do |csv|
	csv << debit
end
