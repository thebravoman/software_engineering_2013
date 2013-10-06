require 'csv'

names_map = Hash.new
CSV.foreach(Dir.pwd + "/" + ARGV[0] + "/Evaluation 2013-2014 - Sheet2.csv") do |row|
	next if row[0] == nil or row[0].length() != 1
	names_map[row[3]] = row[1] + " " + row[2]
end

result = {}
CSV.foreach(Dir.pwd + "/" + ARGV[0] + "results1.csv") do |row|
	name = row[0].split("_")
	result[name[0] + " " + name[1]] = [row[2] == "true" ? 1 : 0, 0]
end

CSV.foreach(Dir.pwd + "/" + ARGV[0] + "results3.csv") do |row|
	name = row[0].split("_")
	#a really long statement(any ideas how to fix that?)
	result[name[0] + " " + name[1]] = 
		[result[name[0] + " " + name[1]] == nil ? 0 : result[name[0] + " " + name[1]][0],
		row[2] == "true" ? 1 : 0]
end

translated = {}
result.each do |entry|
	key = names_map[entry[0]]
	next if key == nil
	translated[key] = entry[1]
end
translated = translated.sort_by { |k,v| k }

CSV.open(Dir.pwd + "/results1.csv", "w") do |csv|
    translated.each do |element|
        csv << [element[0], element[1][0], element[1][1]]
    end
end
