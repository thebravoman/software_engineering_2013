first_sub = 0
last_sub = 0

File.open(ARGV[0]).each do |l|
	if l =~ /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/
		last_sub = l[17..29]
	end
	next if first_sub != 0
	if l =~ /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/
		first_sub = l[0..11]
	end

end

first_sub = (first_sub[0..1].to_i*60*60*1000*1000*1000 + first_sub[3..4].to_i*60*1000*1000*1000 + first_sub[6..7].to_i*1000*1000*1000 + first_sub[9..11].to_i*1000*1000)
last_sub = (last_sub[0..1].to_i*60*60*1000*1000*1000 + last_sub[3..4].to_i*60*1000*1000*1000 + last_sub[6..7].to_i*1000*1000*1000 + last_sub[9..11].to_i*1000*1000)
p last_sub - first_sub
