h = 60*60*1000*1000*1000 
m = 60*1000*1000*1000
s = 1000*1000*1000
ms = 1000*1000
fl = 0
ll = 0
File.readlines(ARGV[0]).each do |l|
	if l =~ /-->/
		ll = l[17..29]
	end
	next unless fl == 0
	if l =~ /-->/
		fl = l[0..11]
	end
end
begin = ( fl[0..1].to_i*h + fl[3..4].to_i*m + fl[6..7].to_i*s + fl[9..11].to_i*ms )
end = ( ll[0..1].to_i*h + ll[3..4].to_i*min + ll[6..7].to_i*s + ll[9..11].to_i*ms )
ns = end - begin
p ns
