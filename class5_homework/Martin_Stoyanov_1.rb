require 'csv'
require 'date'
require 'time'

deadline=DateTime.parse('Mon Sept 30 16:00:00 2013 +0300')
all=Hash.new

CSV.foreach(File.join(ARGV[0].to_s, "Evaluation 2013-2014 - Sheet2.csv")) do |row|
	next unless row[0].to_s.length == 1
		bg = row[1].to_s.strip + " " + row[2].to_s.strip
	if row[3].nil?
		eng=bg
	else
		eng=row[3].to_s
		all[eng] = [bg,0,0,0]
	end
end

Dir.glob(ARGV[0] + "*_1.rb").each do |file|
	result = `git log #{file}`
	lines = result.lines.to_a
	date = DateTime.parse(lines[2].gsub("Date :","").strip)
	name = file.split("_")[0..1]
	key = name[0] + " " + name[1]
	if all.has_key?(key)
		all[key][1] = date
	end
end

Dir.glob(ARGV[0] + "*_3.rb").each do |file|
	result = `git log #{file}`
	lines = result.lines.to_a
	date = DateTime.parse(lines[2].gsub("Date :","").strip)
	name = file.split("_")[0..1]
	key = name[0] + " " + name[1]
	if all.has_key?(key)
		all[key][2] = date
	end
end

all.each do |key,value|
	if (value[1] <= deadline && value[2] <= deadline)
		value[3]="1"
	else
		value[3]="0"
	end
end

all = all.sort_by { |key,value| key[1][0] <=> value[1][0] }

CSV.open("results2.csv","wb") do |csv|
	all.each do |key,value|
		csv << [all[k][0],all[k][2],all[k][3]]
	end
end
