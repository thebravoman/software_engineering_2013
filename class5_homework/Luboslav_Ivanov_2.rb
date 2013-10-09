hour = 60*60*1000*1000*1000 
min = 60*1000*1000*1000
sec = 1000*1000*1000
millis = 1000*1000

file = File.open(ARGV[0])
i = 0

first_array = []
last_array = []

file.each_line do |line|
	if line =~ /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/
		time = line.to_s
		first_array << time.split(/ --> /).first
		last_array << time.split(/ --> /).last
		i += 1
	end
end

sub1 = []
sub1 = first_array[0].gsub(":", ",").split(",")

sub2 = []
sub2 = last_array[i-1].gsub(":", ",").split(",")

nano1 = (sub1[0].to_i)*hour + (sub1[1].to_i)*min + (sub1[2].to_i)*sec + (sub1[3].to_i)*millis
nano2 = (sub2[0].to_i)*hour + (sub2[1].to_i)*min + (sub2[2].to_i)*sec + (sub2[3].to_i)*millis


puts nano2 - nano1

