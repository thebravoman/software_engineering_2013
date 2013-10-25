`ruby #{ARGV[0]} bank.csv 16/03/2013 26/03/2013`
expected_result = 4169.93
p ARGV[0]
if File.exist?("3.txt")
	file = File.open("3.txt", "r")
	if (file.readlines[0]).to_f == expected_result
		p true
	else
		p false
	end
	file.close
	`rm -f 3.txt`
else
	p false
end
