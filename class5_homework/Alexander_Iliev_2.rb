require 'time'
start_point = nil
stop_point = nil
File.open(ARGV[0]).each do |line|
	if line =~ /-->/
		stop_point = line[17..28]
	end
	if line =~ /-->/ && start_point == nil
		start_point = line[0..11]
	end
end
stop_point = Time.parse(stop_point)
start_point = Time.parse(start_point)
puts (stop_point - start_point)*1000000000
