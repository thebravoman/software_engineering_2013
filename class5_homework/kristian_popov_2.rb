i=1
time = Hash.new("")
time2 = Hash.new("")
f = File.open(ARGV[0])
content = f.read
content.each_line do |line|
	if i==2
		time = line.split(" ")[0].to_s
	end
	if line.include? "-->"
		time2 = line.split(" ")[2].to_s
	end
	i+=1
end

time = time.scan( /(\d\d):(\d\d):(\d\d),(\d\d\d)/ )[0].collect { |i| i.to_i }
time2 = time2.scan( /(\d\d):(\d\d):(\d\d),(\d\d\d)/ )[1].collect { |i| i.to_i }
time = time[0] * 3600000 + time[1] * 60000 + time[2] * 1000 + time[3]
time2 = time2[0] * 3600000 + time2[1] * 60000 + time2[2] * 1000 + time2[3]
puts ( time2-time ) * 1000000
