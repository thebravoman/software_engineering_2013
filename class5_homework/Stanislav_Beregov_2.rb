linez = ""
h1 = []
File.readlines(ARGV[0]).each do |line|
	if line =~ /\d{2}:[0-5]\d:[0-5]\d,\d{3} --> \d{2}:[0-5]\d:[0-5]\d,\d{3}/
		linez = line
		h1 << linez
	end
end
puts h1[0]
puts h1[h1.length-1]

s0 = h1[0].split(" --> ")[0].split(/:|,/)
s1 = h1[h1.length-1].split(" --> ")[1].split(/:|,/)
a = s0[0].to_i*3600000*1000000 + s0[1].to_i*60000*1000000 + s0[2].to_i*1000*1000000 + s0[3].to_i*1000000
b = s1[0].to_i*3600000*1000000 + s1[1].to_i*60000*1000000 + s1[2].to_i*1000*1000000 + s1[3].to_i*1000000
puts b-a