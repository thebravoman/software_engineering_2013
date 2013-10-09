require 'time'
subs = []
first = []
last = []
counter = 0
File.open(ARGV[0]).each do |line|
	if line =~ /\d{2}:\d{2}:\d{2},\d{3}/
		subs[counter] = line
		counter += 1	
	end
end
subs[0] = subs[0].split(" --> ")
subs[-1] = subs[-1].split(" --> ")
subs[-1][1] = subs[-1][1].gsub("\n","")
p subs[-1][1] = subs[-1][1].split(":")
last[0] = subs[-1][1][0].gsub(",",".").to_f
last[1] = subs[-1][1][1].gsub(",",".").to_f
last[2] = subs[-1][1][2].gsub(",",".").to_f
inseconds = last[2] + (last[1]*60) + (last[0]*60*60)

inmiliseconds = inseconds * 1000000000
inmiliseconds = inmiliseconds.to_i
p inmiliseconds
