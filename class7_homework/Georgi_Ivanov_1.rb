# In class I was in a group with Hristiqn Zarkov, Martiv Ivanov and Viktor Slavov.
# That's why our programs may end up being identical 

def time(string)
	time = string.split(":")
	h  = time[0].to_i
	m = time[1].to_i
	s = time[2].split(",")[0].to_i
	ms = time[2].split(",")[1].to_i
	return h*60*60*1000 + m*60*1000 + s*1000 + ms
end

time_between_subs = 0.0
text = Array.new
new_line = 0
is_time = false

File.open(ARGV[0], "r").each do |row|
	if(row =~ /-->/)
		is_time = true
		row = row.strip.split("-->")
		row[0] = time(row[0])
		row[1] = time(row[1])
		if(time_between_subs+3000 < row[0])
			new_line = 1
			text << "\n"
		end 
		time_between_subs = row[1]
	end
	if(new_line != 1 && is_time == false && !(row =~ /^[0-9]/) && !(row.empty?))
		text << row.strip
	end
	new_line = 0
	is_time = false
	#text << " "
end

File.open(ARGV[1],"w") do |file|
	text.each_with_index do |text,index|
		if (index%3 == 0 || index == 0)
			file << text + " "
		end
	end
end
