first=0
last=0

File.open(ARGV[0]).each do |line|
	if line =~ /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/
		last = line[17..29]
	end
	next if first != 0
	if line =~ /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/
		first = line[0..11]
	end
		
end

first = (first[0..1].to_i*60*60*1000*1000*1000 + first[3..4].to_i*60*1000*1000*1000 + first[6..7].to_i*1000*1000*1000 + first[9..11].to_i*1000*1000)
last = (last[0..1].to_i*60*60*1000*1000*1000 + last[3..4].to_i*60*1000*1000*1000 + last[6..7].to_i*1000*1000*1000 + last[9..11].to_i*1000*1000)
p last - first

#ナノ秒の変換　を ありがとう　ございます！

