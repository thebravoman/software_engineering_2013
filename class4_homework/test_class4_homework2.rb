require 'csv'

CSV.open("result_from_test2.csv", "w") do |csv|
	Dir.glob("*_2.rb") do |file|
		begin
			result = system "ruby #{file} test_data"
			if result
				result_file = Dir.glob("results2.csv")[0]
				puts File.read(result_file)
				result = `diff #{result_file} test_data/results2_expected.csv`
				result = result.gsub(/[\n\r]/,"")
			end
			csv << [file, result, result == ""]
		rescue Exception => e
			p e
			result = "Exception for #{file}"
			csv << [file, result, false]
		end
	end
end

