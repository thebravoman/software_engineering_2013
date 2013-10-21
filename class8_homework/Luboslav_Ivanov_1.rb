require 'csv'


result = ""


CSV.open("Luboslav_Ivanov_data/result1.csv", "w") do |csv|
	Dir.chdir("../class7_homework")
	Dir.glob("*.rb") do |file|
		`ruby #{file} ../class8_homework/Luboslav_Ivanov_data/28.srt #{file.split("_")[0]}_results.txt`
	end

		Dir.glob("*.txt") do |result_file|
			result =`diff #{result_file} ../class8_homework/Luboslav_Ivanov_data/expected.txt`
			result = result.gsub(/[\n\r]/, "")	
		puts result_file
			if result == ""	
				csv << [result_file, result, 1]
			else
				csv << [result_file,"Result file is not the same the expected!", 0]
			end
	
		 `rm #{result_file}`
		end	


	
end
