require 'csv'
require 'date'

big_money=0.0
small_money=99999999.0
big_date=0
small_date=0
CSV.foreach(ARGV[0]) do |row|
	if big_money<row[2].to_f-row[1].to_f
		big_money=row[2].to_f-row[1].to_f
		big_date=DateTime.parse(row[0])
	end
	if small_money>row[2].to_f-row[1].to_f
		small_money=row[2].to_f-row[1].to_f
		small_date=DateTime.parse(row[0])
	end
end

if big_date>small_date
	date=big_date-small_date
else
	date=small_date-big_date
end
date=date.to_s.chomp("/1")
CSV.open("#{ARGV[0].chomp(".csv")}_result.csv","w") do |csv|
	csv << [date,small_money.round(2),big_money.round(2),(big_money-small_money).round(2)]
end
