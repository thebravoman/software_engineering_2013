require 'csv'



results={}


CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
	next if row[0].to_s.length != 1
	name_bg=row[4].to_s
	name_eng = row[3].to_s.downcase
	results[name_eng] = name_bg,0,0
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|
	temp = row[0].to_s.downcase.split("_")[0..1]
	check = temp[0] + " " + temp[1]
	if results.has_key?(check)
		if row[2] != 'false'
			results[check][2] = 1
		end
	end
end


CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|
	temp = row[0].to_s.downcase.split("_")[0..1]
	check = temp[0] + " " + temp[1]
	if results.has_key?(check)
		if row[2] == 'true'
			results[check][1] = 1
		end
	end
end

results = results.sort {|a,b| a[0] <=> b[0] }
CSV.open("results1.csv", "w") do |row|
		results.each do |ime|
			row << ime[1]
		end
end

