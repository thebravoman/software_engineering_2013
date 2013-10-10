require 'csv'

file = ARGV[0]
val = ARGV[1]

file_name = file.split(".")[0]

CSV.foreach(file).each do |row|
		curr_val = row[4].split(" ")
			
	CSV.open("#{file_name}_result.csv", "w").each do |csv|
		if curr_val[0] == val
			csv << row[0].to_s + row[0].to_s + row[0].to_s + row[0].to_s + row[0].to_s
		end
	end
	
end


