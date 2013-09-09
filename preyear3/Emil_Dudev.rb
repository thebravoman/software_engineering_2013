#!/usr/bin/ruby

c = 0
f = File.open(ARGV[0]).each do |line|
	c += 1 if line =~ /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/
end
puts c

