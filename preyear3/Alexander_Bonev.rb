n=0
na = /-->/

	File.open(ARGV[0], 'r').each do |line|

		if line =~ na
		n = n+1
	end

end

puts "Broqt subtitri e : #{n}" 