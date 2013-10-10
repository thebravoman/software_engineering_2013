hour = 60*60*1000*1000*1000 
min = 60*1000*1000*1000
sec = 1000*1000*1000
millis = 1000*1000
firstl = 0
lastl = 0
File.readlines(ARGV[0]).each do |line|
	if line =~ /-->/
		lastl = line[17..29]
	end
	next unless firstl == 0
	if line =~ /-->/
		firstl = line[0..11]
	end
end
starttime = ( firstl[0..1].to_i*hour + firstl[3..4].to_i*min + firstl[6..7].to_i*sec + firstl[9..11].to_i*millis )
endtime = ( lastl[0..1].to_i*hour + lastl[3..4].to_i*min + lastl[6..7].to_i*sec + lastl[9..11].to_i*millis )
nanos = endtime - starttime
p nanos