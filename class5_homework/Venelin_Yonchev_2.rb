h = 60*60*1000*1000*1000 
m = 60*1000*1000*1000
s = 1000*1000*1000
ms = 1000*1000
fline = 0
lline = 0
pattern = /-->/
File.foreach(ARGV[0]) do |line|
	if line =~ pattern
		lline = line[17..29]
	end
	next unless fline == 0
	if line =~ /-->/
		fline = line[0..11]
	end
end
starttime = ( fline[0..1].to_i*h + fline[3..4].to_i*m + fline[6..7].to_i*s + fline[9..11].to_i*ms )
endtime = ( lline[0..1].to_i*h + lline[3..4].to_i*m + lline[6..7].to_i*s + lline[9..11].to_i*ms )
ns = endtime - starttime
puts ns