require 'csv'

 CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
	row[1] = row[1].to_s.strip
	if row[0].to_s.length == 1
		name = row[1] +" "+ row[2]
		all << [row[3],name,0,0]
	end
 end

 all = all.sort{|a,b| a[1] <=> b[1]}

 CSV.foreach(File.join(ARGV[0],"results.csv")) do |row|
 	name1 = row[0].split("_")[0..1]
	name2 = name1[0] +" "+ name1[1]
	all.each do |element|
		if element[0] == name2
			element[2] = row[2] == "true" ? 1 : 0
		end
	end
 end
 
CSV.foreach(File.join(ARGV[0],results3.csv)) do |row|
	name1 = row[0].split("_")[0..1]
	name2 = name1[0] +" "+ name1[1]
	all.each do |element|
		if element[0] == name2
			element[3] = row[2] == "true" ? 1 : 0
		end
	end
 end
 all.each do |element|
	element.shift
 end
 CSV.open("results1.csv","w") do |csv|
	all.each do |element|
		csv << element
	end
 end  
