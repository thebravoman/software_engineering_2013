require "csv"
string = ""
CSV.foreach("tires.csv") do |row|
	if row[1].to_s == 'summer '
		if row[2].to_i >= 15
			string += row.to_s + "\n"
		end
	end
end
File.open("results.csv", "w") do |file|
	file << string
end
