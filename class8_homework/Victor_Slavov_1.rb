require "csv"

`mkdir executing_test_site`

Dir.chdir("Hristiqn_Zarkov_test_data")

`cp subs.srt ../executing_test_site`
`cp expected_subs.txt ../executing_test_site`

Dir.chdir("../../class7_homework")
i = 0
argument_result_file = 0
CSV.open("../class8_homework/results1.csv", "w") do |csv|
	Dir.glob("*.rb") do |file|
		if !(file =~ /test_/)
			`cp #{file} ../class8_homework/executing_test_site`
		end
	end
	
	Dir.chdir("../class8_homework/executing_test_site")
	
	Dir.glob("*.rb") do |file|
		`ruby #{file} subs.srt 42.txt`
		name = file.split("_")[0] + " " + (file.split("_")[1]).split(".")[0]
		if File.exists?( '42.txt' )
			result = `diff 42.txt expected_subs.txt`
			if result != ""
				csv << [name, result, 0]
			else
				csv << [name, " ", 1]
			end
			`rm -f 42.txt`
		else
			csv << [name, " ", 0]
		end
	end
	Dir.chdir("..")
	`rm -r executing_test_site/`
end
