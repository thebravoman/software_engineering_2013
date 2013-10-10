require 'csv'

money = Hash.new {0.0}

CSV.foreach(ARGV[0]) do |row|
	next if row[4].to_s.split(" ")[0].length != 3
	
	money[row[4].to_s.split(" ")[0]] += row[2].to_i
end

money = money.sort_by { |a,b| b }
newfile = "#{ARGV[0].split('.csv')}_result.csv"
p newfile
CSV.open(newfile, "w") do |csv|
	money.each do |a,b|
		csv << [a,b]
	end
end
