require 'date'
require 'csv'


results={}
full_date=0
i=1
CSV.foreach(File.join("Evaluation 2013-2014 - Sheet2.csv")) do |row|
	next if row[0].to_s.length != 1
	if row[3] == nil
		name_eng = row[4].to_s.downcase
	else
		name_eng = row[3].to_s.downcase
	end
	name_bg=row[4].to_s
	results[name_eng] = name_bg,0,0
end
i = results.length

Dir.glob("*_1.rb")do |file|
	result = `git log #{file}`
	temp = "#{file}".to_s.downcase.split("_")[0..1]
	check = temp[0] + " " + temp[1]	
	full_date = result.lines.to_a[2]
	date_string = full_date.split("Date: ")[1..-1][0].strip
	if results.has_key?(check)
		results[check][1] = date_string
		if Date.parse(date_string) < Date.parse("30/09/2013 - 16:00") 
			results[check][2] = 1
		end
	end
end



Dir.glob("*_3.rb")do |file|
	result = `git log #{file}`
	temp = "#{file}".to_s.downcase.split("_")[0..1]
	check = temp[0] + " " + temp[1]	

	result.each_line do |l|
		l.to_s
		if l.match(/Date/) 
			full_date = l
			break
		end
	end
	
	date_string = full_date.split("Date: ")[1..-1][0].strip
	if results.has_key?(check)
		if Date.parse(results[check][1]) < Date.parse(date_string) 
			results[check][1] = date_string
		end
		if Date.parse(date_string) > Date.parse("30/09/2013 - 16:00") || results[check][2] == 0 || results[check][2]==2
			results[check][2] = 0
		end
	end
end

results = results.sort {|a,b| a[0] <=> b[0] }
CSV.open("results2.csv","w") do |row|
		results.each do |ime|
			row << ime[1]
		end
end












