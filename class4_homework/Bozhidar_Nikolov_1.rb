require 'csv'

def parse_name names_to_split
	names = names_to_split.split("_")[0..1]
	names = names[0].to_s + " " + names[1].to_s
end

file_needed = ARGV[0] + "Evaluation 2013-2014 - Sheet2.csv"

names = Hash.new("")
CSV.foreach(file_needed) do |row|
	if (row[0].to_s.length == 1)
		names[row[3]] = row[1].to_s + " " + row[2].to_s
	end
end

file_needed = ARGV[0] + "results1.csv"

results1 = Hash.new("")
CSV.foreach(file_needed) do |row|
	if row[2] == "true"
		results1[parse_name(row[0])] = "1"
	else
		results1[parse_name(row[0])] = "0"
	end
end

file_needed = ARGV[0] + "results3.csv"

results3 = Hash.new("")
CSV.foreach(file_needed) do |row|
	if row[2] == "true"
		results3[parse_name(row[0])] = "1"
	else
		results3[parse_name(row[0])] = "0"
	end
end

names = names.sort_by { |a, b| b }

CSV.open("results1.csv", "w") do |csv|
	names.each do |row|
		csv << [row[1],results1[row[0]],results3[row[0]]]
	end
end
