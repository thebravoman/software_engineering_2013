require 'csv'

CSV.open("results2.csv", "w") do |csv|
	Dir.glob("*_2.rb") do |file|
		begin
			`mkdir test_execution`
			`cp #{file} test_execution`
			`cd test_execution && ruby #{file} ../bank.csv EUR`
			result = `diff test_execution/bank_result.csv test_data2/bank_expected.csv`
			result = result.gsub(/[\n\r]/,"")
			`rm test_execution/*`
			csv << [file, result, result == ""]
		rescue
			result = "Exception for #{file}"
			csv << [file, result, false]
		end
	end
end

