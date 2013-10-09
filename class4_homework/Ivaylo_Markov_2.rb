require 'csv'
require 'date'

students = Hash.new()
DATE_FORMAT = '%d/%m/%Y %H:%M:%S'
deadline = DateTime.parse('2013-09-30T16:00:00+03:00')


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
	snames = row[0].split('_')[0..1]
	sname = snames[0].strip + " " + snames[1].strip
	row[0] = "../class2_homework" + row[0]
	edate = DateTime.strptime(`git log --format="format:%ct" -- #{row[0]}`.lines.first.chomp, "%s")
	if students.has_key?(sname)
		students[sname][1] = edate
	end
	if edate <= deadline
		if students.has_key?(sname)
			students[sname][2] = 1
		end
	end
end

CSV.foreach(File.join(ARGV[0], "results3.csv")) do |row|
	snames = row[0].split('_')[0..1]
	sname = snames[0].strip + " " + snames[1].strip
	edate = DateTime.strtipe(`git log --format="format:%ct" -- #{row[0]}`, "%s")
	if students.has_key?(sname)
		students[sname][1] = edate
	end
	if edate <= deadline

		if students.has_key?(sname)
			students[sname][2] = 1
		end
	else
		if students.has_key?(sname)
			students[2] = 0
		end
	end
end

CSV.open("results2.csv","wb") do |csv|
	students.each {|key,val|csv << [val[0],val[1],val[2]]}
end
