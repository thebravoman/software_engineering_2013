require 'csv'

CSV.open("results1.csv", "w") do |csv|
	Dir.glob("Bozhidar_Nikolov_1.rb") do |file|
		begin
			`mkdir test_execution`
			`cp #{file} test_execution`
			`cd test_execution && ruby #{file} ../bank.csv EUR`
			puts `ls test_execution`
			result = `diff test_execution/bank.csv_result.csv test_data1/bank_expected.csv`
			result = result.gsub(/[\n\r]/,"")
			`rm test_execution/ -r`
			csv << [file, result, result == ""]
		rescue
			result = "Exception for #{file}"
			csv << [file, result, false]
		end
	end
end

