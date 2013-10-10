require 'csv'
require 'date'
dam = []
Date.parse("ARGV[1]").strftime("%m/%d/%Y")
CSV.foreach(ARGV[0]) do |row|
	if (row[1].year < date.year)
	dam << row[1]
	end
	if (row[1].month < date.month)
	dam << row[1]
	end
	if (row[1].day < date.day)
	dam << row[1]
	end
end
dam.sort[row[2]]
CSV.open("ARGV[0]_result.csv", "w") do |csv|
csv << dam
end
