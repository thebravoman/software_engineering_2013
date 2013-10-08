pattern = /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/
begin_time = ""
end_time = ""

	File.open(ARGV[0],"r").each do |line|

		if line =~ pattern 
			arr_lines = line.split("-->")[0..1]
			
			if begin_time.empty? 
				begin_time = arr_lines[0].strip
			else
				end_time = arr_lines[1].strip
			end
		end

	end

	b_arr = begin_time.split(":")
	e_arr = end_time.split(":")

	b_seconds_arr = b_arr[2].split(",")
	e_seconds_arr = e_arr[2].split(",")

	start = (b_arr[0].to_i)*60*60*1000*1000*1000 + (b_arr[1].to_i)*60*1000*1000*1000 + (b_seconds_arr[0].to_i)*1000*1000*1000 + (b_seconds_arr[1].to_i)*1000*1000
	final = (e_arr[0].to_i)*60*60*1000*1000*1000 + (e_arr[1].to_i)*60*1000*1000*1000 + (e_seconds_arr[0].to_i)*1000*1000*1000 + (e_seconds_arr[1].to_i)*1000*1000
	puts final - start
