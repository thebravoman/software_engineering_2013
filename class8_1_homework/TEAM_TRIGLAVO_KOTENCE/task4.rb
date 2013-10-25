require "csv"

string1 = ""
CSV.foreach(ARGV[0]) do |row|
	if ARGV[1] == "banica"
		if row[0] == "banica"
			string1 += row.to_s + "\n"
		end
	end
	
	if ARGV[1] == "kremvershka"
		if row[0] = "kremvershka"
			string1 += row.to_s + "\n"
		end
	end
	
	if ARGV[1] == "rodobska" && ARGV[2] = "banica"
		if row[0] = "rodobska banica"
			string1 += row.to_s + "\n"
		end
	end
	
	if ARGV[1] == "kremka"
		if row[0] = "kremka"
			string1 += row.to_s + "\n"
		end
	end
end

File.open("result.csv","w") do |file|
	file << string1.to_s
end
