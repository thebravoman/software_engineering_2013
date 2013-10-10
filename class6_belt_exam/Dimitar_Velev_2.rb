require 'csv'
debit = []
amount = 0
CSV.foreach(ARGV[0]) do |row|
	next if row [2] = nil
		amount << [row[4].split(" ")[0],row[2]]		
end
CSV.open("#{ARGV[0]}_result.csv", "w") do |csv|
value.each do |val|
 csv<<[debit]
end
end

