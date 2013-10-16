require 'csv'

CSV.open("result.txt", "wb") do |csv|
	Dir.glob("*_1.rb") do |file|
		`copy #{file} TD_Danail_Stoqnov`
		Dir.chdir "TD_Danail_Stoqnov"
		begin
    			`ruby #{file} subs.srt #{file.gsub(".rb", ".txt")}` 	
    			result = `diff #{file.gsub(".rb", ".txt")} subs_expected.txt`  
    			result = result.gsub(/[\n\r]/,"")
    			csv << [file, result == " "] 
		rescue
    			result = "Exception for #{file}"
    			csv << [file, false]
		end
		Dir.chdir ".."
		`rm -f TD_Danail_Stoqnov/*_1.txt`
		`rm -f TD_Danail_Stoqnov/*_1.rb`
	end
end
