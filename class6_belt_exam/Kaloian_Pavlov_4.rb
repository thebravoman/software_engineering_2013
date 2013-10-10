require 'csv'
require 'date'
filename = ARGV[0]
c = ARGV[1]
all = [] 

CSV.foreach(filename) do |row|
	if row[2] = " "
		row[2] = 0
	end
	if row[1] < c 		
		all << row
	end
end

all.each do |element|
		if element[2] != " "	
			all = all.sort {|a,b| a[2] <=> b[2] } 
		end
end

tmpname = filename.split(".")[0..1]

CSV.open("#{tmpname[0]}_result.csv","w") do |csv|

	all.each do |element|
		csv << element
	end	
	
end
