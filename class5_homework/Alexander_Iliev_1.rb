require 'date'
require 'time'
require 'csv'
all = []
CSV.foreach("Evaluation 2013-2014 - Sheet2.csv") do |csv|
	next if csv[0].to_s.length != 1
	csv[3] = csv[1].strip + " " + csv[2].strip if csv[3] == nil
	all << [csv[3],0,0]
end
Dir.glob("*_1.rb").each do |file|
	result = `git log #{file}`
	lines = result.lines.to_a
	date_string = lines[2].gsub("Date:", "").strip
	date = DateTime.parse date_string
	name = "#{file}".split("_")[0..1]
	name_str = name[0] + " " + name[1]
	all.each do |row|
		row[1] = "#{date}" if row[0] == name_str
	end
end
CSV.foreach("Evaluation 2013-2014 - Sheet2.csv") do |csv|
	next if csv[0].to_s.length != 1
	all.each do |row|
		row[0] = csv[1].strip + " " + csv[2].strip if row[0] == csv[3]
	end
end
File.open("results2.csv", "w") do |csv|
	all.each do |row|
		csv << row
	end
end
# NE e dovurshena za sujalenie
