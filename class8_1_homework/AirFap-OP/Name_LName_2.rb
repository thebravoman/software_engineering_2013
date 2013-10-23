require 'csv'

info = Hash.new {0.0}
CSV.foreach(ARGV[0]) do |row|
	if row[1].to_s.include?("#{ARGV[1].to_s}")
		info[row[0].gsub("champ_","").gsub("_"," ")] = row[3].to_i
	end
end
info = info.sort_by {|a,b| a}
CSV.open(ARGV[0].split('.csv')[0] + '_result.csv',"w") do |csv|
	info.each do |a,b|
		csv << [a,b]
	end
end
