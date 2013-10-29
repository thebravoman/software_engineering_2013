require "csv"

out_arr = []

	CSV.foreach(ARGV[0]) do |row|

		if row[1].to_s == ARGV[1].to_s

			if row[3].to_f < 4.00
		
				out_arr << row

			end

		end

	end

	out_arr = out_arr.sort_by{|a,b,c,d| d}
	out_arr.reverse!

	CSV.open("playlist_task2_result.csv","w") do |csv|
		
		out_arr.each do |elem|

			csv << elem

		end
	
	end
