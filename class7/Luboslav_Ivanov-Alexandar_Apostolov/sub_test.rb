require 'csv'

CSV.open("result.csv", "w") do |csv|
	Dir.glob("*_1.rb") do |file|
		'ruby #{file}'
		result = 'diff #{file.gsub(".rb", ".txt")} sub_expected.txt'
		result = result.gsub(/[\n\r]/,"")
		
		if result == ""
			csv << [file, result, true]
		else 
			csv << [file, result, false]
		end		
	end
	
end






