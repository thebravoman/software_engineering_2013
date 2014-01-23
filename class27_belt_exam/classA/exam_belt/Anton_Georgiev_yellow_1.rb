require 'csv'

all=[]

CSV.foreach(ARGV[0]) do |row|
	if row[1] =~ /#{ARGV[1]}/
	else
		all << [row[3], row[0].gsub("champ_", ""), row[1]]
	end
end

all=all.sort {|a,b| b[1] <=> a[1]}

CSV.open("#{ARGV[0].chomp(".csv")}_result.csv","w") do |csv|
	all.each do |element|
		csv << element
	end
end
