require "csv"
pfone = ""

CSV.foreach("pfone.csv") do |row|
	if ARGV[0].to_i >= row[1].to_i
		if ARGV[1].to_i >= row[2].to_i
			puts row[2]
			pfone += row[0].to_s + "\n"
		end
	end
end

File.open("results.csv", "w") do |file|
	file << pfone
end
