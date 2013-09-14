if 	   ARGV.length == 0
	 puts "Enter File name as an argument after .rb."
 elsif ARGV.length != 1
 puts "wrong number of arguments"
 elsif File.exists?(ARGV[0])
	sub_counter = 0
	File.readlines(ARGV[0]).each do |line|
		if line =~ /-->/ 
			sub_counter += 1
		end
	end
	puts sub_counter
else
	puts "File does not exist."
end