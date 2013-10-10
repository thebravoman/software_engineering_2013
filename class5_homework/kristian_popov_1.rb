require 'date'
require 'time'
require 'csv'

names = Hash.new("") 

CSV.foreach(File.join(ARGV[0], "Evaluation 2013-2014 - Sheet2.csv")) do |row|
	next if row[0].to_s.length() != 1 
	name = row[1].to_s + " " + row[2].to_s
	names[row[3]] = [name,"",0]
end

Dir.glob("ARGV[0]" + "*_1.rb").each do |file|
	result = `git log #{file}`
	lines = result.lines.to_a
	
	date_string = lines[2].gsub("Date:", "").strip
	date = DateTime.parse date_string
	
	name = file.split("_")
	name_english = name[0] + " " + name[1]
	if names.has_key?(name_english)
			names[name_english][1] = date + " "
			if DateTime.parse("Mon Oct 7 20:00:00 2013 +0300") > date
				names[name_english][2]=1;
			end
	end
end


Dir.glob("ARGV[0]" + "*_3.rb").each do |file|
	result = `git log #{file}`
	lines = result.lines.to_a
	
	date_string = lines[2].gsub("Date:", "").strip
	date = DateTime.parse date_string
	
	name = file.split("_")
	name_english = name[0] + " " + name[1]
	if names.has_key?(name_english)
			names[name_english][1] += date
			if DateTime.parse("Mon Oct 7 20:00:00 2013 +0300") > date
				names[name_english][2]=1;
			else
				names[name_english][2]=0;
			end
	end
end


names = names.sort { |a,b| a[0] <=> b[0] }

CSV.open("results1.csv","wb") do |csv|
	names.each do |students|
		csv << students[1]
	end
end
	
	#commit 285e70b0e94f026108c8ad87bbd52b1f5e80a000
	#Author: Venelin Yonchev <vyonchev@abv.bg>
	#Date:   Mon Oct 7 19:13:38 2013 +0300
	
	#names[row[3]] = [name,0,0]
	
	
	#puts "#{file}, #{date}"
