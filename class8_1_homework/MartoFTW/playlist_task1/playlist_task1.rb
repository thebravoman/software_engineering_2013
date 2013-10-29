require "csv"

out_arr = []

	CSV.foreach(ARGV[0]) do |row|
		if row[2].to_s == ARGV[1].to_s
			out_arr << row
		end
	end

	out_arr.each do |elem|
		elem[3] = elem[3].to_f
	end

	CSV.open("playlist_task1_result.csv","w") do |csv|
		out_arr.sort_by{|a,b,c,d| d}.each do |elem|
			csv << elem
		end	
	end
