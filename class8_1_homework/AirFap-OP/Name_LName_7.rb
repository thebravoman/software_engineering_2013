require 'csv'

info = Hash.new {0.0}
t = Hash.new {0.0}
CSV.foreach(ARGV[0]) do |row|
	info[row[0].gsub("champ_","").gsub("_"," ")] = row[2].gsub("date_","")
end
CSV.open(ARGV[0].split('.csv')[0] + '_result.csv',"w") do |csv|
	csv << info.min_by {|a,b| b}
	csv << info.max_by {|a,b| b}
end
