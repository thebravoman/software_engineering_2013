require 'csv'
require 'date'

max = 20130123
min = 20130123
ime = ""
ime1 = ""
all = []

CSV.foreach(ARGV[0]) do |row|
	row[2] = row[2].split("date_")[1]
	row[2] = row[2].gsub("-", "")
	if row[2].to_i > max
		max = row[2].to_i
		ime = row[0].split("champ_")[1]
		if ime =~ /_/
			ime = ime.gsub("_", " ")
		end

	end
	if row[2].to_i < min.to_i
		min = row[2]
		ime1 = row[0].split("champ_")[1]
		if ime1 =~ /_/
			ime1 = ime.gsub("_", " ")
		end
	end
	
end
	
		all << [ime,max]
		all << [ime1,min]
		all.sort_by{|e1,e2| e1 }

CSV.open(ARGV[0].split(".csv")[0].to_s+"_result.csv", "w") do |csv|
	all.each do |e|
		csv << e
	end
end
