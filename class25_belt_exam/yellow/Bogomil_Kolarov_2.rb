require 'csv'

fileName = ARGV[0]
outputFileName = fileName.split(".")[0] + "_result.csv"

klas = ARGV[1]
outputArray = []


CSV.foreach(fileName) do |row|
	next if row[1] == klas
	outputArray << row[3].to_s + "," + row[0].gsub("champ_", "").to_s
end

CSV.open(outputFileName, "w") do |f|
	outputArray.each do |element|
		f << element
	end
end
