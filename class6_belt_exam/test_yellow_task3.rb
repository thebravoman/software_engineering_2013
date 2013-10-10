require 'csv'

CSV.open("results3.csv", "w") do |csv|
	Dir.glob("*_3.rb") do |file|
		begin
			`mkdir test_execution`
			`cp #{file} test_execution`
			`cd test_execution && ruby #{file} ../bank.csv 1002.99`
			result = `diff test_execution/bank_result.csv test_data3/bank_expected.csv`
			result = result.gsub(/[\n\r]/,"")
			`rm test_execution/*`
			csv << [file, result, result == ""]
		rescue
			result = "Exception for #{file}"
			csv << [file, result, false]
		end
	end
end

