require 'time'
end_time = nil
text = Array.new()
File.open(ARGV[0]).each do |row|
	if row =~ /-->/
		split = row.split(" --> ")[0..1]
		start_time = Time.parse(split[0])
		
		diff = start_time - end_time  if end_time != nil
		end_time = Time.parse(split[1])	
	else
		text << row if row.to_s.length > 5
	end
end
File.open(ARGV[1], "w") do |row|
	text.each do |line|
		row << line
	end
end
