require 'time'
end_time = nil
array_text = Array.new()
first_line = false
start_seconds = 0.00
end_seconds = 0.00
endd = 0.00
diff = 0.00
File.foreach(ARGV[0]) do |line|
	if line =~ /-->/
		split = line.split(" --> ")[0..1]
		first_part = split[0]
		second_part = split[1]
		if first_line == false
			end_time = Time.parse(split[1])
			split = second_part.split(":")[2]
			split = split.split(",")[0..1]
			end_seconds = split[0].to_f + (split[1].to_f / 1000)
			first_line = true
			endd = end_time.hour.to_f * 3600.00 + end_time.min.to_f * 60.00 + end_seconds
			next
		else
			start_time = Time.parse(split[0])
			split = first_part.split(":")[2]
			split = split.split(",")[0..1]
			start_seconds = split[0].to_f + (split[1].to_f / 1000)
			start = start_time.hour.to_f * 3600.00 + start_time.min.to_f * 60.00 + start_seconds
			diff = start - endd
	    end_time = Time.parse(second_part)
			split = second_part.split(":")[2]
			split = split.split(",")[0..1]
			end_seconds = split[0].to_f + (split[1].to_f / 1000)
			endd = end_time.hour.to_f * 3600.00 + end_time.min.to_f * 60.00 + end_seconds
		end
        else
		      if line.length > 4
			      if diff <= 3.000
				      array_text << line.strip
			      elsif diff > 3.000
				      array_text << "\r\n\n" + line.strip
			      end
		    end
	  end	
end
	
File.open(ARGV[1], "w") do |row|
	array_text.each do |element|
                row << element
	end
end
