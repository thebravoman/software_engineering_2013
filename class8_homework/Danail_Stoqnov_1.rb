require 'csv'

CSV.open("result.csv", "wb") do |csv|
	Dir.glob("*_1.rb") do |file|
		`copy #{file} Danail_Stoqnov_test_data`
		Dir.chdir "Danail_Stoqnov_test_data"
    			`ruby #{file} subs.srt #{file.gsub(".rb", ".txt")}` 	
    			result = `diff #{file.gsub(".rb", ".txt")} subs_expected.txt`  
    			result = result.gsub(/[\n\r]/,"")
    			#csv << [file, result == 1] 
				#result.gsub(/'	true'/, "1")
			if result == ""
				csv << [file, result, 1]
			else
				csv << [file, result, 0]
			end
		Dir.chdir ".."
		`rm -f Danail_Stoqnov_test_data/*_1.txt`
		`rm -f Danail_Stoqnov_test_data/*_1.rb`
	end
end
