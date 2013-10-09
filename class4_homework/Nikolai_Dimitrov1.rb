require "csv"

student_names = {}
CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
		if (row[0].to_s.length == 1)
			student_names[row[3]] = row[1].to_s + " " + row[2].to_s
		end
end

first_results = {}
CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|
		name = row[0].split("_")[0..1]
		name = name[0].to_s + " " + name[1].to_s
		if (row[2] == "true")
			first_results[name] = "1"
		else
			first_results[name] = "0"
		end
end

second_results = {}
CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|
		name = row[0].split("_")[0..1]
		name = name[0].to_s + " " + name[1].to_s
		if (row[2] == "true")
			second_results[name] = "1"
		else
			second_results[name] = "0"
		end

	end

sort_names = student_names.sort{ |a, b| a <=> b}
CSV.open("results1.csv", "w") do |csv|
	sort_names.each do |row|
		if ((first_results[row[0]]) || (second_results[row[0]]))
			csv << [row[1],first_results[row[0]], second_results[row[0]]]
	
			end		
	
		end

	
	
	end
