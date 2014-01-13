files = Dir.glob("*.rb")
`mkdir results`
system "rm chart.svg"
files.each do |file|
	if file != "test_class14_homework.rb"
		`ruby #{file} data.csv`
		result = system "cp chart.svg results/#{file}.svg"
		if result == false
			p "Can copy for file #{file}"
		end
		`rm -f chart.svg`
	end
end
