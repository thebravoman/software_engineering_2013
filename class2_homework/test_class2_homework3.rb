require 'csv'

CSV.open("results3.txt", "w") do |csv|
	Dir.glob("*_3.rb") do |file|
		result = `ruby #{file}`
		result = result.gsub(/[\n\r]/,"")
		csv << [file, result, result == ARGV[0]]
	end
end

