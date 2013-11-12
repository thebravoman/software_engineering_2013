require "csv"

result = Hash.new(0)

CSV.foreach(ARGV[0]) do |row|
	row[1].each do |f|
		result[f] = row[1]	
	end
end


CSV.open("top.csv", "w") do |csv|
	result.each do |extract|
		csv << extract
	end
end
