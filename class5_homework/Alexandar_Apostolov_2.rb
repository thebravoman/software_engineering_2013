filename = ARGV[0]
line = []
time = []
srt_count = 0
last_line = []


File.open(filename).each do |line|
	if line =~ /^\d+\D\d+\D\d+\D\d+\s\D+\s\d+\D\d+\D\d+\D\d+$/
		srt_count += 1
		if srt_count == 1

			time[0] = time[0].to_f + 
				line[0].to_f*100000 + 
				line[1].to_f*10000 + 
				line[3].to_f*1000 + 
				line[4].to_f*100 + 
				line[6].to_f*10 + 
				line[7].to_f
#			puts time[0].to_f

			time[0] = time[0].to_f + 
			0.1*line[9].to_f + 
			0.01*line[10].to_f + 
			0.001*line[11].to_f

			time[0] = (time[0].to_f).round(3)

		end
		last_line = line
	end
end

time[1] = time[1].to_f + 
	last_line[17].to_f*100000 + 
	last_line[18].to_f*10000 + 
	last_line[20].to_f*1000 + 
	last_line[21].to_f*100 + 
	last_line[23].to_f*10 + 
	last_line[24].to_f
#puts time[0].to_f

time[1] = time[1].to_f + 
	0.1*last_line[26].to_f + 
	0.01*last_line[27].to_f + 
	0.001*last_line[28].to_f

time[1] = (time[1].to_f).round(3)

puts (time[1].to_f - time [0].to_f)*1000000000
