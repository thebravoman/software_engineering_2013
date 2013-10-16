require 'time'

subs = {}
check = 0
kluch = 0
co = 0
arr_out = []

File.open(ARGV[0]).each do |line|
	line = line.strip.to_s
	
	if line.chomp.empty?
		check = 0
		next
	end
	
	if check == 0
		kluch = line.to_i
		subs[kluch] = 0,0,0
		check = 1
		next
	end
	
	if check == 1 
		line = line.split(" --> ")[0..1]
		subs[kluch][0] = line[0]
		subs[kluch][1] = line[1]
		check = 2
		next
	end
	
	if check == 2
		subs[kluch][2] = line.to_s
		check = 3
		next
	end
	
	if check == 3
		subs[kluch][2] = subs[kluch][2] + " " + line.to_s
		next
	end
end


limit = kluch
kluch = 1
time1 = Time.parse(subs[kluch][0])
time2 = Time.parse(subs[kluch][1])
arr_out[co] = subs[kluch][2].to_s
puti = subs.length - 1

puti.times do
	kluch += 1
	time1 = Time.parse(subs[kluch][0])
	period = time1 - time2
	if period > 3
		co += 1		
		arr_out[co] = subs[kluch][2].to_s
	else
		arr_out[co] += " " + subs[kluch][2].to_s
	end
	time2 = Time.parse(subs[kluch][1])
end



puts arr_out
























































