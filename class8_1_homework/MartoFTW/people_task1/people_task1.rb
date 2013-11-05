require "csv"

out_arr = []

	CSV.foreach(ARGV[0]) do |row|

		p pattern = row[2].split(" ")[0]

		if pattern.to_i < ARGV[1].to_i
			out_arr << row 
		end
	end

	CSV.open("people_task1_result.csv","w") do |csv|
		out_arr.sort_by{|a,b,c,d| a}.each do |elem|
			csv << elem
		end
	end
	