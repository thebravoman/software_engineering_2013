require 'csv'
correct = []
wrong = []

all = []
CSV.foreach(ARGV[0]) do |row|
	names = row[0].split("_")[0..1]
	name = names[0] + " " + names[1]
	all << [name, row[2]]
end
all = all.sort {|a,b| a[0] <=> b[0] }
CSV.open("results.csv", "w") do |csv|
	all.each do |element|
		csv << element
	end
end
