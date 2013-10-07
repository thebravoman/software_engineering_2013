require "csv"
mainnames = Hash.new


CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
	next if	row[0].to_s.length !=1
	bgname = row[1].to_s.strip + " " + row[2].to_s.strip
	if row[3].nil?
		engname = bgname
	else
		engname = row[3].to_s
	end
	mainnames[engname] = [bgname, 0, 0]
	
end

CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|
	name = row[0].split("_")[0..1]
	res1name = name[0].to_s + " " + name[1].to_s
	
	if mainnames.has_key?(res1name) and row[2] == "true"
		mainnames[res1name][1] = 1
	elsif mainnames.has_key?(res1name) and row[2] == "false"
		mainnames[res1name][1] = 0
	end
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|
	name = row[0].split("_")[0..1]
	res3name = name[0].to_s + "	" + name[1].to_s
	
	if mainnames.has_key?(res3name) and row[2] == "true"
		mainnames[res3name][2] = 1
	elsif mainnames.has_key?(res3name) and row[2] == "false"
		mainnames[res3name][2] = 0
	end
end

mainnames = mainnames.sort { |a,b|	a[1][0] <=> b[1][0] }
CSV.open("results1.csv",  "w")	do	|csv|
	mainnames.each { |people|		csv << people[1] }
end







	
	
	
	
	