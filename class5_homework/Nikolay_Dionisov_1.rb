require 'csv'
require 'date'

#random date for testing purposes if nil
srok = Date.parse(ARGV[1] == nil ? "13/9/29" : ARGV[1])


names_map = Hash.new
result = {}
CSV.foreach(Dir.pwd + "/" + ARGV[0] + "/Evaluation 2013-2014 - Sheet2.csv") do |row|
	next if row[0] == nil or row[0].length() != 1
	bg_name = (row[1] + " " + row[2]).split.join(" ")
	result[bg_name] = [0, 0]
	next if row[3] == nil
	names_map[row[3].split.join(" ")] = bg_name
end


CSV.foreach(Dir.pwd + "/" + ARGV[0] + "/results1.csv") do |row|
	cmd = "git log --format=\%ct -- " + Dir.pwd + "/" + ARGV[0] + "/" + row[0]
	val = %x[ #{cmd} ]
	date = Date.strptime(val, "%s")
	name = row[0].split("_")
	name = (name[0] + " " + name[1]).split.join(" ")
	name = names_map[name]
	next if name == nil
	next if result[name] == nil
	result[name] = [date, 0]
end

CSV.foreach(Dir.pwd + "/" + ARGV[0] + "/results3.csv") do |row|
	name = row[0].split("_")
	name = (name[0] + " " + name[1]).split.join(" ")
	name = names_map[name]
	next if name == nil
	cmd = "git log --format=\%ct -- " + Dir.pwd + "/" + ARGV[0] + "/" + row[0]
	val = %x[ #{cmd} ]
	date = Date.strptime(val, "%s")
	#a really long statement(any ideas how to fix that?)
	result[name] = 
		[result[name] == nil ? "" : result[name][0],
		(date == nil or date == "") ? 0 : date]
end

result = result.sort_by { |k,v| k }

CSV.open(Dir.pwd + "/results2.csv", "w") do |csv|
	result.each do |element|
        csv << [element[0], 
        		(element[1][0] > element[1][1] ? element[1][0] : element[1][1]),
        		srok >= (element[1][0] > element[1][1] ? element[1][0] : element[1][1]) ? 1 : 0 ]
    end
end
