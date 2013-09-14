br=0
oh = /-->/

File.open(ARGV[0], 'r').each do |line| 

	if line =~ oh 
		br = br+1
	end

end

puts "Broqt subtitri e : #{br}" 
