require 'csv'

info = Hash.new {0.0}
newInfo = Hash.new {0.0}

CSV.foreach(ARGV[0]) do |row|
	info[row[2].gsub("date_","")] = [row[0].gsub("champ_","").gsub("_"," "), row[3].to_i]
end

info = info.sort_by {|a,b| a}
newInfo[0] = info[0]
newInfo[1] = info[9]
newInfo[2] = info[-1]
newInfo = newInfo.sort_by {|a,b| b[2]}

CSV.open(ARGV[0].split(".")[0] + "_result.csv", "w") do |csv|
	newInfo.each do |a,b|
		csv << [b[0],b[1][0], b[1][1]]
	end
end