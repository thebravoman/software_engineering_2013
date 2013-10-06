require 'csv'

names = {}
results1 = {}
results2 = {}
CSV.foreach("names.csv") do |row|
	 	if(row[3] == nil)
			row[3] = row[1].to_s + " " + row[2].to_s
		end
		names[row[3]] = row[1].to_s + " " + row[2].to_s 
end

CSV.foreach("results1.csv") do |row|
	name = row[0].split("_")[0..1]
    name = name[0].to_s + " " + name[1].to_s
	 if (row[2] == "true")
            results1[name] = "1"
        else
            results1[name] = "0"	
        end
end

CSV.foreach("results3.csv") do |row|
	name = row[0].split("_")[0..1]
    name = name[0].to_s + " " + name[1].to_s
	 if (row[2] == "true")
                results2[name] = "1"
        else
                results2[name] = "0"
        end
end

names = names.sort {|a,b| a[0] <=> b[0]}
CSV.open("results1.csv", "w") do |csv|
	names.each do |row|
	if(results1[row[0]] == nil && results2[row[0]] == nil)
		results1[row[1]] = "--"
		results2[row[1]] = "--"
	end
		csv << [row[1], results1[row[0]], results2[row[0]]]
	end
end
