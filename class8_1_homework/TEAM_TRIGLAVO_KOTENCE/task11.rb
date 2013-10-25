require "csv"
tv = ""

CSV.foreach("TV.csv") do |row|
	if ARGV[0].to_i >= row[2].to_i
		if ARGV[1] <= row[1]
			tv += row[0].to_s + "\n"
		end
	end
end

File.open("results.csv", "w") do |file|
	file << tv
end
