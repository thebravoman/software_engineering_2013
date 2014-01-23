require 'csv'

phone = ARGV[1]
all=[]

CSV.foreach(ARGV[0]) do |row|
	if row[4].to_s.include?(phone.to_s)
		all << row
	end
end

all=all.sort_by{|a,b,c,d,e,f|b.to_i}

CSV.open("momicheta_result.csv", 'wb') do |csv|
	all.each do |ye|
		csv << ye
	end
end
