input = File.open(ARGV[0])
numOfSub = 1
newLine = 1
input.each_char do |char|
	if char =~ /\n/
		if newLine == 0
			newLine += 1
		elsif newLine == 1
			numOfSub += 1
			newLine = 0
		end
	else
		newLine = 0
	end
end
puts numOfSub
input.close