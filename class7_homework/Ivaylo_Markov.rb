subs = []
sub = []
p1 = 0
p2 = 0
f = IO.read(ARGV[0])

p1 = f.index(/\d{2}:[0-5]\d:[0-5]\d,\d{3} --> \d{2}:[0-5]\d:[0-5]\d,\d{3}/)
p2 = f.index(/\n\n^\d+$\n/,p1)
pt1 = f[p1,p2].split(' --> ')[0].split(/:|,/)
pt2 = f[p1,p2].split(' --> ')[1].split(/:|,/)
sub[0] = pt1[0].to_i*3600000 + pt1[1].to_i*60000 + pt1[2].to_i*1000 + pt1[3].to_i
sub[1] = pt2[0].to_i*3600000 + pt2[1].to_i*60000 + pt2[2].to_i*1000 + pt2[3].to_i
sub[2] = f[f.index(/\d{2}:[0-5]\d:[0-5]\d,\d{3} --> \d{2}:[0-5]\d:[0-5]\d,\d{3}\n/),p2].gsub(/\d{2}:[0-5]\d:[0-5]\d,\d{3} --> \d{2}:[0-5]\d:[0-5]\d,\d{3}\n/,'').chomp    
puts sub[2]
subs << sub

while true do
p1 = f.index(/\d{2}:[0-5]\d:[0-5]\d,\d{3} --> \d{2}:[0-5]\d:[0-5]\d,\d{3}/,p2)
break if p1.nil? || p1 <= -1
p2 = f.index(/\n\n^\d+$\n/,p1)
if p2.nil? || p2 < -1
	p2 = f.size
end
print p2
pt1 = f[p1,p2].split(' --> ')[0].split(/:|,/)
pt2 = f[p1,p2].split(' --> ')[1].split(/:|,/)
sub[0] = pt1[0].to_i*3600000 + pt1[1].to_i*60000 + pt1[2].to_i*1000 + pt1[3].to_i
sub[1] = pt2[0].to_i*3600000 + pt2[1].to_i*60000 + pt2[2].to_i*1000 + pt2[3].to_i
sub[2] = f[f.index(/\d{2}:[0-5]\d:[0-5]\d,\d{3} --> \d{2}:[0-5]\d:[0-5]\d,\d{3}\n/),p2].gsub(/\d{2}:[0-5]\d:[0-5]\d,\d{3} --> \d{2}:[0-5]\d:[0-5]\d,\d{3}\n/,'').chomp    
puts sub[2]
subs << sub
break if p2 == f.size

end

File.open("Ivaylo_Markov.txt","w") do |file|

	subs.each do |s|
		file.write(s[2])
	end

end
