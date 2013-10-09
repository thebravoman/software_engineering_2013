require 'csv'

names_map = Hash.new

result = {}
CSV.foreach(Dir.pwd + "/" + ARGV[0] + "/Evaluation 2013-2014 - Sheet2.csv") do |row|
	next if row[0] == nil or row[0].length() != 1
	names_map[row[3]] = (row[1] + " " + row[2]).split.join(" ")
	result[(row[1] + " " + row[2]).split.join(" ")] = [0,0]
end

CSV.foreach(Dir.pwd + "/" + ARGV[0] + "/results1.csv") do |row|
	name = row[0].split("_")
	name = (name[0] + " " + name[1]).split.join(" ")
	key = names_map[name]
	next if key == nil
	result[key] = [row[2] == "true" ? 1 : 0, 0]
end

CSV.foreach(Dir.pwd + "/" + ARGV[0] + "/results3.csv") do |row|
	name = row[0].split("_")
	name = (name[0] + " " + name[1]).split.join(" ")
	key = names_map[name]
	next if key == nil
	#a really long statement(any ideas how to fix that?)
	result[key] = 
		[result[key] == nil ? 0 : result[key][0],
		row[2] == "true" ? 1 : 0]
end

result = result.sort { |a,b| a <=> b }

CSV.open(Dir.pwd + "/results1.csv", "w") do |csv|
    result.each do |element|
        csv << [element[0], element[1][0], element[1][1]]
    end
end
