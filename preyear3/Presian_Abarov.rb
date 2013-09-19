#!/usr/bin/ruby

count = 0
File.open(ARGV[0]).each do |line| 
	count += 1 if line =~ /\s-->\s/
end

puts count