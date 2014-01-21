require 'csv'

fileName = ARGV[0]
outputFileName = fileName.split(".")[0] + "_result.csv"

klas = ARGV[1]
outputArray = []

CSV.foreach(fileName) do |row|
	next if row[1].downcase.split("/")[0] == klas.downcase
	next if row[1].downcase.split("/")[1] == klas.downcase
	next if row[1].downcase == klas.downcase

	outputArray << row[3] + "," + row[0].gsub("champ_", "").gsub("_", " ")
end

outputArray = outputArray.sort_by do |s|
	s.split(',')[0].to_i
end

outputArray = outputArray.reverse

CSV.open(outputFileName, "wb") do |f|
	outputArray.each do |element|
	    f << [element.split(",")[0], element.split(",")[1]]
    end
end
