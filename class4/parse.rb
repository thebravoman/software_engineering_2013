require 'csv'
correct = []
wrong = []

all = []
CSV.foreach(ARGV[0]) do |row|
	names = row[0].split("_")[0..1]
	name = names[0] + " " + names[1]
	all << [name, row[2]=="true" ? 1 : 0]
end
names = {}
CSV.foreach("names.csv") do |row|
	names[row[1]] = row[0]
end
p names

# all [
	#~ ["name", 1]
	#~ ["name2", 0]
#]

all.each do |element|
	puts element[0]
	# element - ["name", 1]
	# element[0] - "name"
	# names {
	#   "name"=>"име"
	# }
	# names[element[0]] -> име
	element[0] = names[element[0]]
	if element[0] == nil
		element[0] = ""
	end
	# element - ["име", 1]
end
p all
all = all.sort {|a,b| a[0] <=> b[0] }
CSV.open("results.csv", "w") do |csv|
	all.each do |element|
		csv << element
	end
end

