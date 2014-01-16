require 'csv'
require 'csv'

small_date=DateTime.parse("9999-12-31")
big_date=DateTime.new
date=[]

CSV.foreach(ARGV[0]) do |row|
	if big_date<DateTime.parse(row[2].split("date_")[1])
		big_date=DateTime.parse(row[2].split("date_")[1])
	end
	if small_date>DateTime.parse(row[2].split("date_")[1])
		small_date=DateTime.parse(row[2].split("date_")[1])
	end
end

second_date=big_date
diff=big_date-small_date+1

CSV.foreach(ARGV[0]) do |row|
	if second_date-small_date<diff && second_date-small_date!=0
		second_date=DateTime.parse(row[2].split("date_")[1])
		diff=second_date-small_date
	end
end

CSV.foreach(ARGV[0]) do |row|
	if small_date==DateTime.parse(row[2].split("date_")[1]) || big_date==DateTime.parse(row[2].split("date_")[1]) || second_date==DateTime.parse(row[2].split("date_")[1])
		date << [row[2].split("date_")[1],row[0].split("champ_")[1].gsub("_"," ")]
	end
end

date=date.sort {|a,b| a[0] <=> b[0]}

CSV.open("#{ARGV[0].chomp(".csv")}_result.csv","w") do |csv|
	date.each do |element|
		csv << element
	end
end
