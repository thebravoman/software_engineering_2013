require 'csv'

names = Hash.new("")

CSV.foreach(File.join(ARGV[0], "Evaluation 2013-2014 - Sheet2.csv")) do |row|
	next if row[0].to_s.length() != 1 
	name = row[1].to_s + " " + row[2].to_s
	names[row[3]] = [name,0,0]
end

CSV.foreach(File.join(ARGV[0], "results1.csv")) do |row|
	name = row[0].split("_")
	name_english = name[0] + " " + name[1]
	if names.has_key?(name_english)
		if row[2].to_s == "true"
			names[name_english][1] = 1 
		end
	end
end

CSV.foreach(File.join(ARGV[0], "results3.csv")) do |row|
	name = row[0].split("_")
	name_english = name[0] + " " + name[1]
	if names.has_key?(name_english)
		if row[2].to_s == "true"
			names[name_english][2] = 1 
		end
	end
end

names = names.sort { |a,b| a[0] <=> b[0] }

CSV.open("results1.csv","wb") do |csv|
	names.each do |students|
		csv << students[1]
	end
end
