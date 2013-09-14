filename = ARGV[0]
counter = 0

File.open(filename).each do |line|
	if line =~ /^\d+\s*$/
		counter += 1
	end
end
print(counter)