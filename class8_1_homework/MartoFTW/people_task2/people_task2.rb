require "csv"

out_arr = []

	CSV.foreach(ARGV[0]) do |row|

		row[3] = row[3].to_i

		if row[1].to_f >= ARGV[1].to_f
			out_arr << row 
		end
	end

	out_arr = out_arr.sort_by{|a,b,c,d| d}
	out_arr.reverse!

	CSV.open("people_task2_result.csv","w") do |csv|
		out_arr.each do |elem|
			csv << elem
		end
	end
	
