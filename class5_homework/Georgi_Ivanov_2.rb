require 'csv'

start_time = ""
end_time = ""

file = File.open(ARGV[0], "r")
file.each do |line|
	if(line =~ /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/)
		holder = line.split("-->")[0..1]
		if start_time == ""
			start_time = holder[0].strip
		else
			end_time = holder[1].strip
		end
	end
end

holder = start_time.split(",")[0..1]
start_time = holder[0]
holder = end_time.split(",")[0..1]
end_time = holder[0]

holder = start_time.split(":")[0..2]
start_hour = holder[0]*60*60
start_minute = holder[1]*60
start_second = holder[2]

start_time = (start_hour + start_minute + start_second).to_i

holder = end_time.split(":")[0..2]
end_hour = holder[0]*60*60
end_minute = holder[1]*60
end_second = holder[2]

end_time = (end_hour + end_minute + end_second).to_i

difference = (end_time - start_time)*1000*1000*1000
puts difference