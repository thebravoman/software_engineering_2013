def time_parse(time)
	t = time.split(":")
	return t[2].to_f + t[1].to_f * 60.00 + t[0].to_f * 3600.00
end
subs = []
i = 0
found = 0
new_line = 0

File.readlines(ARGV[0]).each do |line|
	if new_line == 1
		if line == "\n"
			i += 1
			new_line = 0
		else
			subs[i][2] = subs[i][2] + line.gsub("\n", "")
		end
	end
	if found == 1
		subs[i][2] = line.gsub("\n", "")
		found = 0
		new_line = 1
	end
	if line =~ /-->/
		time = line.split(" --> ")
		subs[i] = [time[0].sub(",", "."), time[1][0..11].sub(",", "."), ""]
		found = 1
	end
end

paragraphs = []
i = 0
paragraphs[i] = ""
end_prev = time_parse(subs[0][1])
subs.each do |subtitle|
	if time_parse(subtitle[0]) - end_prev > 3.0
		i += 1
		paragraphs[i] = subtitle[2]
	else
		paragraphs[i] = paragraphs[i] + subtitle[2]
	end
	end_prev = time_parse(subtitle[1])
end
File.open(ARGV[1], "w") do |file|
	paragraphs.each do |paragraph|
		file << paragraph
		file << "\n"
	end
end
