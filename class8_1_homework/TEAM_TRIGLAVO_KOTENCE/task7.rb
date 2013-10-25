require "csv"
string = ""
suotnoshenie = 0.0
max = 0.0
broqch = 0
min = 0.0
CSV.foreach("alcohol.csv") do |row|
	if row[0].to_s == ARGV[0].to_s
		if ARGV[1].to_s == 'quality'
			suotnoshenie = row[3].to_f / row[2].to_f
			if suotnoshenie > max
				string = row[1].to_s
				max = suotnoshenie
			end
		end
		if ARGV[1].to_s == 'price'
			suotnoshenie = row[3].to_f / row[2].to_f
			if broqch == 0
				min = suotnoshenie
				broqch = 1
			end
			if suotnoshenie < min
				string = row[1].to_s
				min = suotnoshenie
			end
		end
	end
end
File.open("results.csv", "w") do |file|
	file << string
end
