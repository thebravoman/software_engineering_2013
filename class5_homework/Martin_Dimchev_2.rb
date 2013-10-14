require 'time'
require 'date'


counter = 0
count=0
time2=""
time1=""
f = File.open(ARGV[0]).each do |line|
	if line =~ /-->/
		temp = line.split("-->")[0..1]
		main = temp[0].to_s.split(":")
		temp = temp[1].to_s.split(":")
		hour = temp[0].to_i*60*60*100
		min = temp[1].to_i*60*100
		temp1 = temp[2]
		temp2 = temp1.split(",")
		sec = temp2[0].to_i*100
		mil = temp2[1].to_i
		time2 = hour.to_i+min.to_i+sec.to_i+mil.to_i  
		if counter == 0
			counter += 1
				hour = main[0].to_i*60*60*100
				min = main[1].to_i*60*10
				temp1 = main[2]
				temp2 = temp1.split(",")
				sec = temp2[0].to_i*100
				mil = temp2[1].to_i
			time1 = hour.to_i+min.to_i+sec.to_i+mil.to_i 
		end
	end
end

f.close

puts (time2-time1)*1000000000
