require 'csv'

CSV.open("results3.csv", "w") do |csv|
	Dir.glob("*_3.rb") do |file|
		begin 
			result = `ruby #{file}`
			result = result.gsub(/[\n\r]/,"")
		rescue
			result = "Exception for #{file}"
		end
		csv << [file, result, result == ARGV[0]]
	end
end

