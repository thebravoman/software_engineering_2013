first = 0
last = 0

File.readlines(ARGV[0]).each do |line|
if line =~ /-->/
	last = line[17..29]
end
next unless first == 0
if line =~ /-->/
	first = line[0..11]
end
end

b = (first[0..1].to_i*60*60*1000 + first[3..4].to_i*60*1000 + first[6..7].to_i*1000 + first[9..11].to_i)
e = (last[0..1].to_i*60*60*1000 + last[3..4].to_i*60*1000 + last[6..7].to_i*1000 + last[9..11].to_i)
p (e-b)*1000*1000
