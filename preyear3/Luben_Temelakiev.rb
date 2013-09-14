n = 0
s = / --> /
file = ARGV[0]
f = File.open("#{file}", "r")

f.each do |line|
	n +=1 if line =~ s
end

puts "Number of subtitles = #{n}"
