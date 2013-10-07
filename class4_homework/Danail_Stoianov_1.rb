require 'csv'

names = {}
results1 = {}
results2 = {}
CSV.foreach(File.join(ARGV[0] + "Evaluation 2013-2014 - Sheet2.csv")) do |row|
	 	if (row[3] == nil)
			row[3] = "fukc you piece of shit"
		end
		names[row[3]] = row[4]
end

CSV.foreach(File.join(ARGV[0] + "results1.csv")) do |row|
	name = row[0].split("_")[0..1]
    name = name[0].to_s + " " + name[1].to_s
	 if (row[2] == "true")
            results1[name] = "1"
        else
            results1[name] = "0"	
        end
end

CSV.foreach(File.join(ARGV[0] + "results3.csv")) do |row|
	name = row[0].split("_")[0..1]
    name = name[0].to_s + " " + name[1].to_s
	 if (row[2] == "true")
                results2[name] = "1"
        else
                results2[name] = "0"
        end
end

names = names.sort {|a,b| a[0] <=> b[0]}
CSV.open("results2.csv", "w") do |csv|
	names.each do |row|
	if(results1[row[0]] == nil && results2[row[0]] == nil)
		results1[row[1]] = "--"
		results2[row[1]] = "--"
	end
		csv << [row[1], results1[row[0]], results2[row[0]]]
	end
end
