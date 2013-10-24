require 'csv'
bus = []

CSV.foreach(ARGV[0]) do |row|
	if row[1].split(":")[0]==ARGV[1]
		bus << [row[0].to_i,row[1]]
	end
end

bus=bus.sort {|a,b| a[0]<=>b[0]}
CSV.open("#{ARGV[0].chomp(".csv")}_result.csv", "w") do |csv|
	bus.each do |e|
		csv << e
	end
end
