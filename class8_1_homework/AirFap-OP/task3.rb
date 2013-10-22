require 'csv'
require 'date'

info = Hash.new {0.0}
CSV.foreach(ARGV[0]) do |row|
	next if Date.parse(row[2]) >= Date.parse(ARGV[1])
	info[row[0].gsub("champ_","").gsub("_"," ")] = row[1]
end
info = info.sort_by {|a,b| b}.reverse
CSV.open(ARGV[0].split('.csv')[0] + '_result.csv',"w") do |csv|
	info.each do |a,b|
		csv << [a,b]
	end
end
