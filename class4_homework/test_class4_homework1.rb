require 'csv'

CSV.open("results1.csv", "w") do |csv|
	Dir.glob("*_1.rb") do |file|
		begin
			`mkdir test_execution`
			`cp #{file} test_execution`
			`cd test_execution && ruby #{file} ../test_data/`
			result = `diff test_execution/results1.csv test_data/results1_expected.csv`
			result = result.gsub(/[\n\r]/,"")
			`rm test_execution/*`
			csv << [file, result, result == ""]
		rescue
			result = "Exception for #{file}"
			csv << [file, result, false]
		end
	end
end

