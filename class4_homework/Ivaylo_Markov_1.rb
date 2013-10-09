require 'csv'

students = Hash.new()


CSV.foreach(File.join(ARGV[0], "Evaluation 2013-2014 - Sheet2.csv")) do |row|
	next if row[0].to_s.length() != 1 
	name = row[1].strip + " " + row[2].strip
	if row[3].nil? then
		 row[3] = name
	end
	students[row[3]] = [name,0,0]
	#p students[row[1] + row[2]]

end

CSV.foreach(File.join(ARGV[0], "results1.csv")) do |row|
	fname = row[0].split("_")
	nname = fname[0] + " " + fname[1]
	if students.has_key?(nname) then
		if row[2].strip == "true" then
			students[nname][1] = 1 
		end
	end
end

CSV.foreach(File.join(ARGV[0], "results3.csv")) do |row|
	fname = row[0].split("_")
	nname = fname[0] + " " + fname[1]
	if students.has_key?(nname) then
		if row[2].strip == "true" then
			students[nname][2] = 1 
		end
	end
end

students = students.sort_by {|key,val| val[0]}

CSV.open("results1.csv","wb") do |csv|
	students.each {|key,val|csv << [val[0],val[1],val[2]]}
end

#test code
#CSV.open("../ivo1.csv","wb") do |csv|
#	students.each {|key,val|csv << [val[0],val[1],val[2]]}
#end
