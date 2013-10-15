require 'csv'

CSV.open("result.csv", "w") do |csv|
	Dir.glob("*.rb") do |file|
		'ruby #{file}'
		result = 'diff #{file.gsub(".rb", ".txt")} sub_expected.txt'
		result = result.gsub(/[\n\r]/,"")
		
		csv << [file, result, result == ""]	
	end	
end
