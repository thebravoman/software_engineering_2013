if ARGV.length==0
		puts "Please,Enter the file name after Stefan_Stamenov.rb"
elsif File.zero?(ARGV[0])
	puts "Sorry,the file is empty so there's no subtitles in the file"

elsif File.exists?(ARGV[0])
	subs=0
	f = File.open(ARGV[0]).each do |line|
		if line =~ /^\d\d:\d\d:\d\d,\d\d\d\s*-->/
			subs+= 1
		end
	end
	if subs==0 
	puts "There are no subtitles in this file"
	else
	puts subs
	end
else puts "The file you want to open doesn't exist"
end
