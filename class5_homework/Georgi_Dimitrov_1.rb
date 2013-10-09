hour = 60*60*1000*1000*1000 
min = 60*1000*1000*1000
sec = 1000*1000*1000
millis = 1000*1000
File.readlines(ARGV[0]).each do |line|
	if line =~ /-->/
		Masiv << line
	end
end
first = Masiv[0][0..11]
last = Masiv[-1][17..29]

start = ( first[0..1].to_i*hour + first[3..4].to_i*min + first[6..7].to_i*sec + first[9..11].to_i*millis )
ending= ( last[0..1].to_i*hour + last[3..4].to_i*min + last[6..7].to_i*sec + last[9..11].to_i*millis )
p ending - start