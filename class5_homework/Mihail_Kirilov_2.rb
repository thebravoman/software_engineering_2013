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
subs[0][0] = subs[0][0].gsub("\n","")
subs[0][0] = subs[0][0].split(":")

subs[-1] = subs[-1].split(" --> ")
subs[-1][1] = subs[-1][1].gsub("\n","")
subs[-1][1] = subs[-1][1].split(":")

first[0] = subs[0][0][0].gsub(",",".").to_f
first[1] = subs[0][0][1].gsub(",",".").to_f
first[2] = subs[0][0][2].gsub(",",".").to_f

last[0] = subs[-1][1][0].gsub(",",".").to_f
last[1] = subs[-1][1][1].gsub(",",".").to_f
last[2] = subs[-1][1][2].gsub(",",".").to_f

first[3] = (first[0]*60*60*1000*1000*1000) + (first[1]*60*1000*1000*1000) + (first[2]*1000*1000*1000)
last[3] = (last[0]*60*60*1000*1000*1000) + (last[1]*60*1000*1000*1000) + (last[2]*1000*1000*1000) 

final = last[3] - first[3]
final = final.to_i
puts final
