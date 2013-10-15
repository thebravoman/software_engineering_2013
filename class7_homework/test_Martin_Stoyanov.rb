require 'csv'

CSV.open("result.txt", "wb") do |csv|
	Dir.glob("*_1.rb") do |file|
		`cp #{file} Martin_Stoyanov_Test_Data`
		Dir.chdir "Martin_Stoyanov_Test_Data"
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
		`rm -f Martin_Stoyanov_Test_Data/*_1.txt`
		`rm -f Martin_Stoyanov_Test_Data/*_1.rb`
	end
end
