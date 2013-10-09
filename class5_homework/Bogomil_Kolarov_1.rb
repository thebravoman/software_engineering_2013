require 'date'
require 'csv'

hash = {}
dead_line = "30/09/2013 - 16:00"
test = ""

CSV.foreach( File.join( 'Evaluation 2013-2014 - Sheet2.csv' ) ) do |row|
	next if row[0].to_s.length != 1
	row[1] = row[1].strip << ' ' << row[2].strip
	row[3] = row[1] if row[3].nil?
	hash[row[3]] = [row[1], "", 0]
end

Dir.glob("*_1.rb")do |temp1|
	result = `git log #{temp1}`
	name = "#{temp1}".to_s.split("_")[0..1]
	lines = result.lines.to_a
	date_string = ""
	test = name[0] + " " + name[1]	
	lines.each do |line|
		if  line.include? "Date:"
	        date_string = line.split("Date: ")[1..-1][0].strip
			break
		end
	end
	if hash.has_key? (test)
		hash[test][1] = DateTime.parse(date_string)
		if hash[test][1] < DateTime.parse("30/09/2013 - 16:00")
			hash[test][2] = 1 
		end
	end
end

Dir.glob("*_3.rb")do |temp2|
 	result = `git log #{temp2}`
	name = "#{temp2}".to_s.split("_")[0..1]
	lines = result.lines.to_a
	date_string = ""
	test = name[0] + " " + name[1]	
	lines.each do |line|
		if  line.include? "Date:"
	        date_string = line.split("Date: ")[1..-1][0].strip
			break
		end
	end
	if hash.has_key? (test)
		hash[test][1] = DateTime.parse(date_string)
		if hash[test][1] >= DateTime.parse("30/09/2013 - 16:00")
			hash[test][2] = 0
		end
	end
end		

hash = hash.sort {|a,b| a[0] <=> b[0] }

CSV.open("results2.csv","w") do |row|
	hash.each do |ime|
		row << ime[1]
	end
end
