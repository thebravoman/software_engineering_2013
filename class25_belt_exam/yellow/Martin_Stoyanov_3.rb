require 'csv'

years=ARGV[1].to_i
all=[]
CSV.foreach(ARGV[0]) do |row|
	 if row[3].length == 4 and row[1].to_i - 2 <= years and row[1].to_i + 2 >= years
		all << row
	end
end

all = all.sort_by{|a,b,c,d,e|b.to_i}

CSV.open("momicheta_result.csv", "wb") do |csv|
	all.each do |ye|
		csv << ye
	end
end
