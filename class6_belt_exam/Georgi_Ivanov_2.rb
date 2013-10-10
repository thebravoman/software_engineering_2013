require 'csv'

debit = Hash.new("")

CSV.foreach(ARGV[0]) do |row|
	temp = row[4].split(" ")[0..1]
	valuta = temp[0].strip
	if valuta == temp[0]
		debit[valuta] += row[2].to_s
	end
end

debit = debit.sort{ |a,b| a <=> b}

file = File.open("bank_result.csv", "w") do |csv|
	debit.each do |x|
		csv << [x, "\n"]
	end
end

