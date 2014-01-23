require 'csv'

fileName = ARGV[0]
phoneNumbers = ARGV[1]
outputFileName = "momicheta_result.csv"


girlsArray = Array.new

CSV.foreach(fileName) do |row|
	if row[4].to_s.include?(phoneNumbers)
		girlsArray << row
	end
end

girlsArray = girlsArray.sort_by {|e| e[1].to_i}

CSV.open(outputFileName, "wb") do |row|
	girlsArray.each do |element|
		row << element
	end
end