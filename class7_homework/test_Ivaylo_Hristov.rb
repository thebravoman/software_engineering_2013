require 'csv'
#ruby test_Ivaylo_Hristov.rb subs.srt subs_expected.txt
CSV.open("result.csv", "wb") do |csv|
	`mkdir IH_Test_Data`
	Dir.glob("*.rb") do |file|
		`cp #{file} IH_Test_Data`
		Dir.chdir "IH_Test_Data"
		begin
    			result = system "ruby #{file} #{ARGV[0]}"
				if result
					result = `diff #{file.gsub(".rb", ".txt")} #{ARGV[1]}`  
					result = result.gsub(/[\n\r]/,"")
				end
    			csv << [file, result, result == " "] 
		rescue
    			result = "Exception for #{file}"
    			csv << [file, result, false]
		end
		Dir.chdir ".."
		`rm -f IH_Test_Data/#{file}`
		`rm -f IH_Test_Data/#{file.gsub(".rb", ".txt")}`
	end
	`rm -f IH_Test_Data/ -r`
end