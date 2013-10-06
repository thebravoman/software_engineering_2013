require 'csv'
require 'date'

#random date for testing purposes if nil
srok = Date.parse(ARGV[1] == nil ? "13/9/29" : ARGV[1])


names_map = Hash.new
CSV.foreach(Dir.pwd + "/" + ARGV[0] + "/Evaluation 2013-2014 - Sheet2.csv") do |row|
	next if row[0] == nil or row[0].length() != 1
	names_map[row[3]] = row[1] + " " + row[2]
end

result = {}
CSV.foreach(Dir.pwd + "/" + ARGV[0] + "results1.csv") do |row|
	cmd = "git log --format=\%ct " + Dir.pwd + "/" + ARGV[0] + row[0]
	val = %x[ #{cmd} ]
	date = Date.strptime(val, "%s")
	name = row[0].split("_")
	name = name[0] + " " + name[1]
	result[name] = [date, 0]
end

CSV.foreach(Dir.pwd + "/" + ARGV[0] + "results3.csv") do |row|
	name = row[0].split("_")
	name = name[0] + " " + name[1]
	cmd = "git log --format=\%ct " + Dir.pwd + "/" + ARGV[0] + row[0]
	val = %x[ #{cmd} ]
	date = Date.strptime(val, "%s")
	#a really long statement(any ideas how to fix that?)
	result[name] = 
		[result[name] == nil ? 0 : result[name][0],
		(date == nil or date == "") ? 0 : date]
end

translated = {}
result.each do |entry|
	key = names_map[entry[0]]
	next if key == nil
	translated[key] = entry[1]
end
translated = translated.sort_by { |k,v| k }

CSV.open(Dir.pwd + "/results2.csv", "w") do |csv|
    translated.each do |element|
        csv << [element[0], 
        		element[1][0] > element[1][1] ? element[1][0] : element[1][1],
        		srok >= (element[1][0] > element[1][1] ? element[1][0] : element[1][1]) ? 1 : 0 ]
    end
end
