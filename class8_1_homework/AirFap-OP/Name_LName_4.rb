require 'csv'	

info = Hash.new {0.0}
CSV.foreach(ARGV[0]) do |row|
	next if row[3].to_i != ARGV[1].to_i
	info[row[0].gsub("champ_","").gsub("_"," ")] = [row[1],row[2].gsub("date_",""),row[3].to_i]
end
info = info.sort_by {|a,b| b[0]}
CSV.open(ARGV[0].split('.csv')[0] + '_result.csv',"w") do |csv|
	info.each do |a,b|
		csv << [a,b[0],b[1],b[2]]
	end
end
