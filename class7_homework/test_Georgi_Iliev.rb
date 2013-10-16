require 'csv'

CSV.open("results1.csv", "w") do |csv|
	Dir.glob("*_1.rb") do |file|
		begin
			`mkdir test_execution`
			`cp #{file} test_execution`
			`cd test_execution && ruby #{file} ../Georgi_Iliev_test_data/`
			result = `diff test_execution/subs.txt Georgi_Iliev_test_data/parsed_subs_expected.txt`
			result = result.gsub(/[\n\r]/,"")
			`rm test_execution/*`
			csv << [file,result == ""]
		rescue
			result = "Exception for #{file}"
			csv << [file, result, false]
		end
	end
end
