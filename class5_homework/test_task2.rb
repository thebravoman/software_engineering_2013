require 'csv'

CSV.open("results2.csv", "w") do |csv|
	`mkdir test_execution`
	`cp 28.srt test_execution`
	Dir.glob("*_2.rb") do |file|
		`cp #{file} test_execution`
		Dir.chdir "test_execution"
		begin
			result = `ruby #{file} 28.srt`
			result = result.gsub(/[\n\r]/,"")
			csv << [file, result, result == "1109650000000"]
		rescue Exception => e
			result = "Exception for #{file}"
			csv << [file, result, false]
		end
		Dir.chdir ".."
		`rm -f test_execution/*_2.rb`
		`rm -f test_execution/*_result*.csv`
	end
	`rm -f test_execution/ -r`
end

