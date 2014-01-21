require 'csv'
require 'time'

array = []

CSV.foreach(ARGV[0]) do |row|
	array << [row[2].split("_")[1], row[0].split("_")[1],row[0].split("_")[2]]
end

array = array.sort {|a, b| DateTime.parse(a[0])<=> DateTime.parse(b[0])}
array = array[0],array[1],array[-1]
array = array.sort {|a, b| a[1] <=> b[1]}


puts array
CSV.open(ARGV[0].split(".csv")[0] + "_result.csv" , "w") do |csv|
	array.each do |element|
		csv << element
	end
end
