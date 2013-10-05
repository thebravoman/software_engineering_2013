require 'csv'

correct = []
wrong = []
CSV.foreach(ARGV[0]) do |row|
	names = row[0].split("_")[0..1]
	name = names[0] + " " + names[1]
	if row[2] == 'true'
		correct << name
	else
		wrong << name
	end
end

names = Hash.new("")
CSV.foreach("names.csv") do |row|
	names[row[1]] = row[0]
end
all = []
correct.each do |english_name|
	all << [names[english_name], "1"]
end
wrong.each do |english_name|
	all << [names[english_name], "0"]
end

all = all.sort {|a,b|	a[0] <=> b[0] }
CSV.open("results.csv", "w") do |csv|
	all.each do |element|
		csv << [element[0],element[1]]
	end
end






