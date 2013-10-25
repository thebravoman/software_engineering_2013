require "csv"
max = 0
razlika = 0
predmet = ""
evtin_predmet = ""
min = 0
broqch = 0
CSV.foreach("Objects.csv") do |row|
	if broqch == 0
		min = row[1].to_i
		broqch += 1
		evtin_predmet = row[0].to_s + ","
	end
	if row[1].to_i > max
		max = row[1].to_i
		predmet = row[0].to_s + ","
	end
	if row[1].to_i < min
		min = row[1].to_i
		broqch += 1
		evtin_predmet = row[0].to_s + ","
	end
end
razlika = max - min
File.open("results.csv", "w") do |file|
	file << predmet + evtin_predmet + razlika.to_s
end
