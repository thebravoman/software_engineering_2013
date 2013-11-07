require 'csv'
require 'date'


arr = []
the_rows = []
CSV.foreach(ARGV[0]) do |row|
	arr << row
end

file_name = ARGV[0].gsub("csv","")

arr = arr.sort_by{|a,b,c| Date.parse(c)}

the_rows << arr[0]
the_rows << arr[arr.count-1]


	the_rows[0][0]=the_rows[1][0].gsub("champ_","")
	the_rows[1][0]=the_rows[1][0].gsub("champ_","")
	the_rows[0][2]=the_rows[0][2].gsub("date_","")
	the_rows[1][2]=the_rows[0][2].gsub("date_","")


CSV.open(file_name + "_result.csv" ,"wb") do |csv|
	csv << the_rows[0]
	csv << the_rows[1]
end
