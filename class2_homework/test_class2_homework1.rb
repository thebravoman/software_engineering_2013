require 'csv'

CSV.open("results1.txt", "w") do |csv|
	Dir.glob("*_1.rb") do |file|
		result = `ruby #{file} 20/09/13 30/09/13`
		result = result.gsub(/[\n\r]/,"")
		csv << [file, result, result == ARGV[0]]
	end
end

