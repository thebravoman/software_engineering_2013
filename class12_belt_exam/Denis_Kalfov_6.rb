require 'csv'
sama_zaeta=ARGV[1].to_s
all=Array.new(0)

CSV.foreach(ARGV[0]) do |row| #girls.csv
	if sama_zaeta==row[3].to_s
		all<<[row[0],row[1],row[2],row[3],row[4]]
	end
end

all=all.sort_by { |a,b,c,d,e|b.to_i }

CSV.open("momicheta_result.csv","w") do |csv|
	all.each do |a,b,c,d,e|
		csv<<[a,b,c,d,e]
	end
end