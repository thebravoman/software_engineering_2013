require "time"

pattern = /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/
time_seconds = 0
start_time = 0
end_time = 0
i = 0
File.open(ARGV[0], "r").each do |line|
	if (line =~ pattern) && (i == 0)
		start_time = Time.parse(line.split("-->")[0])
		i+=1
	end
	if line =~ pattern
		end_time = Time.parse(line.split("-->")[1])
	end
end

time_seconds = (end_time - start_time)*1000000000
puts time_seconds.to_i