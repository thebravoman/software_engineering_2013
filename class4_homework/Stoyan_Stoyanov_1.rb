require "csv"
names = Hash.new("")

	CSV.foreach(File.join(ARGV[0], "Evaluation 2013-2014 - Sheet2.csv")) do |row|
	
		if((row[0].to_s.length) != 1)
			next
		else
			names[row[3]] = row[1].to_s + " " + row[2].to_s
	end
end

r1 = Hash.new("")

	CSV.foreach(File.join(ARGV[0], "results1.csv")) do |row|
	
		name = row[0].split("_")[0..1]
		name = name[0].to_s + " " + name[1].to_s
		if(row[2] == "true")
			r1[name] = "1"
		else
			r1[name] = "0"
	end
end

r2 = Hash.new("")

	CSV.foreach(File.join(ARGV[0], "results3.csv")) do |row|
		
		name = row[0].split("_")[0..1]
		name = name[0].to_s + " " + name[1].to_s
		if(row[2] == "true")
			r2[name] = "1"
		else
			r2[name] = "0"
	end
end

	CSV.open("results.csv", "w") do |csv|
		
		names.sort{ |a, b| a <=> b }.each do |row|
		if((r1[row[0]]) || (r2[row[0]]))
			csv << [row[1], r1[row[0]], r2[row[0]]]
		end
	end
end
