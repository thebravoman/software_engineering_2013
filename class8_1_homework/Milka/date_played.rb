require 'csv'
require 'date'
played = Array.new()
date = Date.strptime(ARGV[1], '%d/%m/%Y')
CSV.foreach(ARGV[0]) do |csv|
	csv_date = Date.strptime(csv[0], '%d/%m/%Y')
	played << [csv[1], csv[2]] if (date == csv_date)
end
CSV.open("date_played_result.csv", "w") do |row|
	played.each do |element|
		row << element
	end
end