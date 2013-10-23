require 'csv'
require 'date'

date1 = Date.parse(ARGV[1])
date2 = Date.parse(ARGV[2])
name_temp = ""

name = {}

CSV.foreach(ARGV[0],"r") do |row|

	if (Date.parse(row[2]) >= date1 && Date.parse(row[2]) <= date2 || Date.parse(row[2]) <= date1 && Date.parse(row[2]) >= date2) && row[3].to_i == 1

		name_temp = row[0] + " " + row[1]
		name[name_temp] = row[2]
	end
end
name = name.sort_by { |name,date| date }
CSV.open("#{ARGV[0].chomp(".csv")}_result.csv","w") do |csv|
		name.each() do |el|
        	csv << el
		end
end

