require 'time'

s = 0
res = 0
f = 0
co1 = 0

File.open( ARGV[0] ).each do |srt|
    if srt =~ /-->/ && co1 == 0
		s = Time.parse(srt.split(" --> ")[0])
		co1 = 1
	end
    if srt =~ /-->/
		f = Time.parse(srt.split(" --> ")[1])
    end
end

res = (f-s)*1000000000
puts res.to_i