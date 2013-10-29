require 'csv'
require 'time'

all=[]
splitter=0
splitter_min=0
time=0
time_check=Time.parse(ARGV[1])

CSV.foreach(ARGV[0]) do |row|
	time=Time.parse(row[0])
	if time<=time_check
	 	all<< [row[0],row[1],row[2],row[3]]
	end
end

all=all.sort {|a,b| a[0] <=> b[0]}

CSV.open("#{ARGV[0].chomp(".csv")}_results.csv","w") do |csv|
	all.each do |element|
	 	csv << element
	 end
end
