#!/usr/bin/ruby

first = ""
last = ""
File.foreach(ARGV[0]) do |line|
	if line =~ /-->/ 
		last = line[17..-1].to_s.strip
				next unless first.empty?
			first = line[0..12].to_s.strip
	end
end

first = (first.split /[,:]/).collect { |x| x.to_i }
last = (last.split /[,:]/).collect { |x| x.to_i }

first = first[0] * 3600000 + first[1] * 60000 + first[2] * 1000 + first[3]
last = last[0] * 3600000 + last[1] * 60000 + last[2] * 1000 + last[3]
puts ( last-first ) * 1000000
