
first, last = "", ""
File.foreach(ARGV[0]) do |line|
	next if not (line =~ /-->/)
	first = line.gsub(/.+--> /, "") if first == ""
	last = line.gsub(/ -->.+/, "")
end

first = first.split(",")
first[0] = first[0].split(":")
last = last.split(",")
last[0] = last[0].split(":")

time_start = first[0][0].to_i * 60 * 60 * 1000 + 
			first[0][1].to_i * 60 * 1000 +
			first[0][2].to_i * 1000 +
			first[1].to_i
time_end = last[0][0].to_i * 60 * 60 * 1000 + 
			last[0][1].to_i * 60 * 1000 +
			last[0][2].to_i * 1000 +
			last[1].to_i
			
puts (time_end - time_start) * 1000 * 1000
