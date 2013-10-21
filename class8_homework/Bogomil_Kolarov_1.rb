require 'csv'


Dir.chdir("../class7_homework")

	Dir.glob("*_1.rb") do |file|
		if !(file =~ /test/)
			`cp #{file} ../class8_homework/Bogomil_Kolarov_test_data`
		end        
	end

Dir.chdir("../class8_homework/Bogomil_Kolarov_test_data")

CSV.open("results1.csv", "w") do |csv|

	Dir.glob("*.rb") do |file|
		`mkdir test_execution` unless Dir.exist?('test_execution')
		'cp ../Bogomil_Kolarov_test_data/28.srt test_execution'
		`cp #{file} test_execution`
		`cd test_execution && ruby #{file} 28.srt > temp.txt`

		if 	('temp.txt').empty?
			result = `diff test_execution/out.txt Bogomil_Kolarov_test_data/expected.txt`

		'rm temp.txt'
		end



	end
end
