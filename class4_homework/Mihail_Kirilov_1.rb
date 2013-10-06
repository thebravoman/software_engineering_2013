require 'csv'

names = {}
first_homework = {}
second_homework = {}
#The first argument in the command line is the results from the first homework
#The second argument in the command line is the results from the second homework
#The third argument in the command line is the Evaluation sheet
CSV.foreach(ARGV[2],headers:true) do |row| 
	unless row[1].nil? and row[2].nil? 
		names[row[3]] = row[1].gsub(" ","") + " " + row[2].gsub(" ","") 
	end
end

CSV.foreach(ARGV[0]) do |row|
	persons_names = row[0].split("_")[0..1]
	name = persons_names[0] + " " + persons_names[1]
	first_homework[name] = (row[2] == 'true' ? 1 : 0)
end

CSV.foreach(ARGV[1]) do |row|
	persons_names = row[0].split("_")[0..1]
	name = persons_names[0] + " " + persons_names[1]
	second_homework[name] = (row[2] == 'true' ? 1 : 0)
end

all = []
names.each do |key,value|
	all << [value,first_homework[key],second_homework[key]] #unless first_homework[key].nil?
end

all = all.sort {|a,b|	a[0] <=> b[0] }
CSV.open("results.csv", "w") do |csv|
	all.each do |element|
		csv << [element[0],element[1],element[2]]
	end
end
