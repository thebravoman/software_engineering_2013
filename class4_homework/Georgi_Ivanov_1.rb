require "csv"

student_names = Hash.new("")
CSV.foreach(File.join(ARGV[0], "Evaluation 2013-2014 - Sheet2.csv")){ |row|
	if((row[0].to_s.length) == 1)
		student_names[row[3]] = row[1].to_s + " " + row[2].to_s
	end
}

task1_results = Hash.new("")
CSV.foreach(File.join(ARGV[0], "results1.csv")){ |row|
	holder = row[0].split("_")[0..1]
	holder = holder[0].to_s + " " + holder[1].to_s
	if(row[2] == "true")
		task1_results[holder] = "1"
	else
		task1_results[holder] = "0"
	end
}

task2_results = Hash.new("")
CSV.foreach(File.join(ARGV[0], "results3.csv")){ |row|
	holder = row[0].split("_")[0..1]
	holder = holder[0].to_s + " " + holder[1].to_s
	if(row[2] == "true")
		task2_results[holder] = "1"
	else
		task2_results[holder] = "0"
	end
}
 
student_names.sort{ |a, b| a <=> b }

CSV.open("results1.csv", "w"){ |csv|
	student_names.each do |row|
		if((task1_results[row[0]]) || (task2_results[row[0]]))
			csv << [row[1], task1_results[row[0]], task2_results[row[0]]]
		end
   end
}