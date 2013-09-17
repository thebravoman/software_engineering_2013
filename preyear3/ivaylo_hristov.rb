if ARGV.length != 1
	puts "Incorrect usage\nUsage: ruby ProgramName.rb SRTFile.srt"
elsif File.exists?(ARGV[0])
	counter = 0
	subf = ARGV[0]
	searcher = /-->/
	File.readlines(subf).each do |line|
		if line =~ searcher
			counter += 1
		end
	end
	puts counter
else
	puts "Incorrect filename/Unexisting file"
end