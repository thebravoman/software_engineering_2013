require "csv"
string = ""
suotnoshenie = 0.0
max = 0.0
broqch = 0
min = 0.0
CSV.foreach("alcohol.csv") do |row|
	if row[0].to_s == ARGV[0].to_s
		if row[2].to_f == max
			string += "\n" + row[1].to_s
			max = row[2].to_f
		end
		if row[2].to_f > max
			string = row[1].to_s
			max = row[2].to_f
		end
	end
end
File.open("results.csv", "w") do |file|
	file << string
end
