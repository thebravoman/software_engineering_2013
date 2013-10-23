require 'csv'
require 'date'

many_people=0
little_people=99999999
big_money=0
small_money=0
d1=0
d2=0
CSV.foreach(ARGV[0]) do |row|
        if many_people<row[1].to_i
                many_people=row[1].to_i
                big_money=row[2].to_f
		d1=Date.parse(row[0])
        end
        if little_people>row[1].to_f
                little_people=row[1].to_i
                small_money=row[2].to_f
		d2=Date.parse(row[0])
        end
end

CSV.open("#{ARGV[0].chomp(".csv")}_result.csv","w") do |csv|
        csv << [d1, many_people,big_money,d2, little_people, small_money]
end
