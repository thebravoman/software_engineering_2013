require 'csv'
require 'date'

all = []
DATE_FORMAT = '%d/%m/%Y %H:%M:%S'
krsrok = DateTime.parse('2013-09-30T16:00:00+03:00')


CSV.foreach("Evaluation 2013-2014 - Sheet2.csv") do |row|
	if row[0].to_s.length() != 1
		name = row[1].strip + " " + row[2].strip
	end
	if row[3].nil? then
		row[3] = name
	end	
	all = [row[3],name,0,0]
end

CSV.foreach("results1.csv") do |row|
	row[0] = row[0].strip
	tmpname = row[0].split('_')[0..1]
	tmpname1 = tmpname[0] + " " + tmpname[1]
	row[0] = "../class2_homework" + row[0]
	comdate = DateTime.strptime(`git log --format="format:%ct" -- #{row[0]}`.lines.first.chomp, "%s")
	all.each do |element|
		if element[1] == tmpname1
			element[2] = comdate
		end
	end

	if comdate <= krsrok
		all.each do |element|
			if element[1] == tmpname1
				element[3] = 1
			end
		end
	end	
end


CSV.foreach("results3.csv") do |row|
	row[0] = row[0].strip
	tmpname = row[0].split('_')[0..1]
	tmpname1 = tmpname[0] + " " + tmpname[1]
	comdate = DateTime.strtipe(`git log --format="format:%ct" -- #{row[0]}`, "%s")

	all.each do |element|
		if element[1] == tmpname1
			element[2] = comdate
		end
	end

	if comdate <= krsrok
		all.each do |element|
			if element[1] == tmpname1
				element[3] = 1
			end
		end
	else
		all.each do |element|
			if element[1] == tmpname1
				element[3] = 1
			end
		end
	end
end
all.each do |element|
	element.shift
end


CSV.open("results2.csv","wb") do |csv|
  csv < all
end
	
