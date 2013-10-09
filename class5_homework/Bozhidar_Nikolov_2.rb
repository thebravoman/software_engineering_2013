start_time_string = ""
end_time_string = ""
start_time_is_found = false
start_time_float = 0.00
end_time_float = 0.00
result = 0.00
tryhard = 0

File.open(ARGV[0]).each do |line|
	if line =~ /-->/
		if start_time_is_found == false
			start_time_string = line.split(" --> ")[0]
			start_time_is_found = true
		end
		end_time_string = line.split(" --> ")[1]
	end
end

start_time_string = start_time_string.split(":")[0..2]
end_time_string = end_time_string.split(":")[0..2]

start_time_float = start_time_string[0].to_f * 3600 + start_time_string[1].to_f * 60
start_time_string[2] = start_time_string[2].split(",")[0..1]
start_time_float += start_time_string[2][0].to_f
tryhard = start_time_string[2][1].to_f / 1000
start_time_float += tryhard

end_time_float = end_time_string[0].to_f * 3600 + end_time_string[1].to_f * 60 
end_time_string[2] = end_time_string[2].split(",")[0..1]
end_time_float += start_time_string[2][0].to_f
tryhard = end_time_string[2][1].to_f / 1000
end_time_float += tryhard

result = ((end_time_float - start_time_float) * 1000000000).to_i
puts result
