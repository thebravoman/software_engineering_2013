	# In class i worked with Hristian Zarkov, Georgi Ivanov and Victor Slavov. If their programs are the same that is the reason.	

	def time(string)
		time = string.split(":")
		h  = time[0].to_i
		m = time[1].to_i
		s = time[2].split(",")[0].to_i
		ms = time[2].split(",")[1].to_i
		return (h*3600000 + m*60000 + s*1000 + ms).to_i
	end

	text = Array.new
	first_sub = true
	read = true
	time_line = false
	new_sub = false
	beg = 0
	ent = 0
	arr_time = []

	File.open(ARGV[0],"r+").each do |row|
		row.gsub("\r","")
	end

	File.open(ARGV[0],"r").each do |row|
		if row =~ /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/
			new_sub = true
			time_line = true           	
			
			if first_sub
	                	arr_time = row.strip.split("-->")
        	        	first_sub = false 
			else 
				beg = time(arr_time[1])
				arr_time = row.strip.split("-->")
				ent = time(arr_time[0])
							

				if ent-beg < 3000
					read = true
				else
					read = false
				end
			end
        	end
        
		new_sub = false if row =~ /^\s$/

		if new_sub && !(time_line)
			if !(read) 
				text << "BREAK"
				text << "BREAK" 
				text << row.gsub("\n","") 
			else 
				text << row.gsub("\n","")
			end
		end

        	time_line = false
	end

	

	File.open(ARGV[1],"w") do |file|
		text.each do |t|
			if t == "BREAK"
				file << "\n"
			else
				file << t
			end
        	end
	end
