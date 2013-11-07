require 'csv'
require 'date'
small = ""
big = ""
champs = []
first = 1;
out = [2]
CSV.foreach(ARGV[0]) do |row|
	row[2] = row[2].gsub("date_","")
	row[2] = DateTime.parse(row[2],"%Y-%M-%D")
	row[0] = row[0].gsub("champ_","")
	champs << row
end

champs.each do |champ|
	if first == 1 
		small = champ[2]
		big = champ[2]
		first = 0
	end
	if champ[2] > big
		big = champ[2]
		out[0] = champ
	end
	if champ[2] < small
		small = champ[2] 
		out[1] = champ
	end
end

out = out.sort_by {|a,b|a[2] <=> b[2]}

CSV.open(ARGV[0]+"_result.csv","w") do |csv|
	out.each do |el|
	csv << [el[0],el[2].strftime("%Y-%M-%D").split("/")[0]]
	end
end 
