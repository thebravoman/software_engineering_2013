require 'csv'

klas = ARGV[1]

people = Hash.new("")

CSV.open(ARGV[0], "r").each do |row|
	name = row[1] + " " + row[2]
	if row[0] == klas
		people[name] = row[0]
	end
end

people = people.sort_by{|a,b| a}

CSV.open("output_3.csv", "w") do |csv|
	people.each do |key, value|
		csv << [value, key]
	end
end
