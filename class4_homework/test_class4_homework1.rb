require 'csv'

CSV.open("results1.csv", "w") do |csv|
	`mkdir test_execution`
	Dir.glob("*_1.rb") do |file|
		`cp #{file} test_execution`
		Dir.chdir "test_execution"
		begin
			result = system "ruby #{file} ../test_data"
			if result
				result_file = Dir.glob("results1.csv")[0]
				puts File.read(result_file)
				result = `diff #{result_file} ../test_data/results1_expected.csv`
				result = result.gsub(/[\n\r]/,"")
			end
			csv << [file, result, result == ""]
		rescue Exception => e
			p e
			result = "Exception for #{file}"
			csv << [file, result, false]
		end
		Dir.chdir ".."
		`rm -f test_execution/*_1.rb`
		`rm -f test_execution/*_result*.csv`
	end
	`rm -f test_execution/ -r`
end

