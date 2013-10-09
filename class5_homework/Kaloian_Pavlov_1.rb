require 'csv' 
require 'date'
ime = [] 
site = []

DATE_FORMAT = '%d/%m/%Y %H:%M:%S'

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
	if row[0].to_s.length == 1 || row[0].to_s.length == 2 && row[0].to_s !=	 "qq"			
		ime = row[1].to_s.strip + " " + row[2].to_s.strip
		site << [row[3],ime,0,0]
	end
end

end_date = DateTime.parse( 'Mon Sep 30 16:00:00 2013 +0300' )
Dir.glob("*_1.rb").each do |file|
	res = `git log #{file}`
	lastcom = res.lines.to_a[2]
	file = file.to_s.split("_")[0..1]
	jo = file[0] + " " + file[1]
	lastcomdate = DateTime.parse(lastcom.split("Date: ")[1..-1][0].strip)
	
	
	site.each do |element|
		if jo == element[0]
			element[2] = lastcomdate
			if lastcomdate <= end_date 
				element[3] = '1'
			else
				element[3] = '0'
			end
		
		end
	end			
end

Dir.glob("*_3.rb").each do |file|

	res = `git log #{file}`
	lastcom = res.lines.to_a[2]
	if file.to_s == "Mihail_Kirilov_3.rb" 
		lastcom = res.lines.to_a[3] 
	end	
	file = file.to_s.split("_")[0..1]
	jo = file[0] + " " + file[1]
	lastcomdate = DateTime.parse(lastcom.split("Date: ")[1..-1][0].strip)
	
	site.each do |element|
	
		if jo == element[0]
		
			if element[2] < lastcomdate
				element[2] = lastcomdate
			end	
	
			if lastcomdate > end_date && element[3] != 0
				element[3] = 0
			end
									
		end
	end
				
end

site.each do |element|
	element.shift
end 

site = site.sort{|a,b| a[0] <=> b[0]}

CSV.open("results2.csv","w") do |csv|
	site.each do |element|
		csv << element
	end
end
