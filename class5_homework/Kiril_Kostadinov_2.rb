srt = File.readlines(ARGV[0])
start = srt[1].split(" --> ")[0]
s = start.split(':')
s[2].sub!(',', '.')
t_start = s[2].to_f + s[1].to_f * 60.00 + s[0].to_f * 3600.00
l = srt.length
while(srt[l] == nil || srt[l] == "\r\n")
	l -= 1
end
l -= 1
finish = srt[l].split(" --> ")
finish[1] = finish[1][0..11]
f = finish[1].split(':')
f[2].sub!(',', '.')
t_finish = f[2].to_f + f[1].to_f * 60.00 + f[0].to_f * 3600.00
seconds = t_finish - t_start
puts (seconds * 1000000000).to_i
