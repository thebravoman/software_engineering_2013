if ARGV.length == 0
	puts "Please write an argument."
elsif File.exists?(ARGV[0])
	sub_count = 0
	File.readlines(ARGV[0]).each do |line|
		if line =~ /-->/ 
			sub_count += 1
		end
	end
	puts sub_count
else
	puts "File does not exist."
end
