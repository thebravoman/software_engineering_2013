#!/usr/bin/ruby

unless ARGV[1]
	puts "First argument: srt file", "Second argument: ruby program to check"
	exit
end
testdata = `ruby #{ARGV[1]} #{ARGV[0]}`
bigreg = '^'
type = 0
sub = [nil, nil, ""]
lastsub = [nil,[0,-3000],""]
File.foreach( ARGV[0] ) do |l|
	if type == 2 && l.strip!.empty?
		if sub[1][0] - lastsub[1][1] < 3000
			lastsub[2] << ' ?' << sub[2]
			lastsub[1][1] = sub[1][1]
		else
			bigreg << lastsub[2] << '[\n\r]+' unless lastsub[2].empty?
			lastsub = sub
		end
		type = 0
		sub = [nil, nil, ""]
	end
	next if l.empty?
	if type == 0
		sub[0] = l.to_i
		type = 1
	elsif type == 1
		sub[1] = l.scan( /(\d\d):(\d\d):(\d\d),(\d\d\d)/ ).each { |time| time.collect! { |x| x.to_i } }.map! {
				|i| i[0] * 3600000 + i[1] * 60000 + i[2] * 1000 + i[3] }
		type = 2
	else
		sub[2] << ' ?' unless sub[2].empty?
		sub[2] << Regexp.escape( l )
	end
	
end
bigreg << lastsub[2] << '[\n\r]+' unless lastsub[2].empty?
bigreg << '$'
puts( Regexp.new( bigreg ) =~ testdata ? true : false )

