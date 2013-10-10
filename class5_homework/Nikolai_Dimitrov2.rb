 require "time"
 
first = 0
last = 0
first_line = 0
seconds = 0

File.open(ARGV[0]).each  do |line|
	if (line =~ /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/) && (first_line == 0)

		first = Time.parse(line.split("-->")[0])
		first_line += 1
	end
	if line =~`/^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/
		last = Time.parse(line.split("-->")[1])
	end
	


	if first_line == 0
		p wrong 
	end
	if first_line == 1
	seconds (last - first)*1000000000
	
	end
end

puts seconds.to_i