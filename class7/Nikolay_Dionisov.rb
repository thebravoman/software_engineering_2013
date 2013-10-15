
file = ARGV[0]
f = File.open(file)
lines = 0
i = 0
f.each do |l|
	lines+=1
end
f.seek(0, IO::SEEK_SET)


def pack_sub(f, i, lines)
	return [lines + 1,[0,0,0,0]] if i >= lines
	n = f.readline().to_i
		
	timestamp = f.readline()
	tstart, tend = timestamp.split(" --> ")
	start_h = tstart.gsub(/:\d+:\d+,\d+$/, "")
	start_m = tstart.gsub(/^\d+:/, "").gsub(/:\d+,\d+$/, "")
	start_s = tstart.gsub(/^\d+:\d+:/, "").gsub(/,\d+$/, "")
	start_ms = tstart.gsub(/^\d+:\d+:\d+,/, "")
	starttime = start_h.to_i * 60 * 60 * 1000 +
			 start_m.to_i * 60 * 1000 +
			 start_s.to_i * 1000 + start_ms.to_i
	
	end_h = tend.gsub(/:\d+:\d+,\d+$/, "")
	end_m = tend.gsub(/^\d+:/, "").gsub(/:\d+,\d+$/, "")
	end_s = tend.gsub(/^\d+:\d+:/, "").gsub(/,\d+$/, "")
	end_ms = tend.gsub(/^\d+:\d+:\d+,/, "")
	endtime = end_h.to_i * 60 * 60 * 1000 +
			 end_m.to_i * 60 * 1000 +
			 end_s.to_i * 1000 + end_ms.to_i
			 
			 
	i+=3
	
	text = ""
	new_line = f.readline
	while i < lines - 1 do
		break if new_line =~ /^$/
		text += new_line
		new_line = f.readline
		i += 1
	end
	return [i, [n, starttime, endtime, text]]
end

i = 0
text = ""

i, last_sub = pack_sub(f,i,lines)

wf = File.open(ARGV[1], "w")
wf << last_sub[3].gsub("\n", "")
while i < lines do
	i,new_sub = pack_sub(f,i,lines)
	if new_sub[1] - last_sub[2] > 3000
		wf << "\n"
	else
		wf << " "
	end
	wf << new_sub[3].gsub("\n", "")
	last_sub = new_sub
end
