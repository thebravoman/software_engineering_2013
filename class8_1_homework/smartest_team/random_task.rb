require 'csv'

random=[]
CSV.foreach(ARGV[0]) do |row|
	if ARGV[1].to_i<row[0].to_i
		random_number=rand(row[0].to_i*2)
		random << [row[0],random_number,(random_number.to_f/row[0].to_f).round(10)]
	end
end

random = random.sort {|a,b| b[2]<=>a[2]}
CSV.open("#{ARGV[0].chomp(".csv")}_result.csv","w") do |csv|
	random.each do |element|
		csv << element
	end
end
