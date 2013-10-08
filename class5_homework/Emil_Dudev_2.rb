#!/usr/bin/ruby

type = 0
sub = [0, "", ""]
first = ""
File.foreach(ARGV[0]) do |l|
	if type == 2 && l.strip!.empty?
		type = 0
		sub[2] = ""
	end
	next if l.empty?
	if type == 0
		sub[0] = l.to_i
		type = 1
	elsif type == 1
		sub[1] = l
		type = 2
		first = sub[1] if sub[0] == 1
	else
		sub[2] << '\n' unless sub[2].empty?
		sub[2] << l
	end
	
end
last = sub[1]
first = first.scan( /(\d\d):(\d\d):(\d\d),(\d\d\d)/ )[0].collect { |i| i.to_i }
last = last.scan( /(\d\d):(\d\d):(\d\d),(\d\d\d)/ )[1].collect { |i| i.to_i }
first = first[0] * 3600000 + first[1] * 60000 + first[2] * 1000 + first[3]
last = last[0] * 3600000 + last[1] * 60000 + last[2] * 1000 + last[3]
puts ( last-first ) * 1000000
