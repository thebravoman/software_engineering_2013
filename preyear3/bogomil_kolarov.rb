input_file = ARGV[0]
count = 0
f = File.open(input_file, 'r')
f.each do |line|
	if line =~ /-->/
		count += 1
	end
end
f.close
puts "the number of subtitles is: #{count}"
