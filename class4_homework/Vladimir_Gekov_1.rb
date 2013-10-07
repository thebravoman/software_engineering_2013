require 'csv'

 CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
	row[1] = row[1].to_s.strip
	if row[0].to_s.length == 1
	ime = row[1] +" "+ row[2]
  vs << [row[3],name,0,0]
	end
 end

 vs = vs.sort{|a,b| a[1] <=> b[1]}
 CSV.foreach(File.join(ARGV[0],"results.csv")) do |row|
 	ime1 = row[0].split("_")[0..1]
	ime2 = ime1[0] +" "+ ime1[1]
	vs.each do |element|
		if element[0] == ime2
		element[2] = row[2] == "true" ? 1 : 0
		end
	end
 end
 
CSV.foreach(File.join(ARGV[0],results3.csv)) do |row|
	ime1 = row[0].split("_")[0..1]
	ime2 = ime1[0] +" "+ ime1[1]
	vs.each do |element|
		if element[0] == ime2
		element[3] = row[2] == "true" ? 1 : 0
		end
	end
 end
 vs.each do |element|
	element.shift
 end
 CSV.open("results1.csv","w") do |csv|
	vs.each do |element|
	csv << element
	end
end  
