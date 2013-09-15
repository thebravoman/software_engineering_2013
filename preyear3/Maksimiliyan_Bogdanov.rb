c = 0
sub = / --> /
file = ARGV[0]
 f = File.open("#{file}", "r")

 f.each do |line|
	c +=1 if line =~ sub
end

puts c
