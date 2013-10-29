require 'csv'

price1 = 0
price2 = 0
sorting_array = Array.new()
i = 0
name = ""
hero_count1 = 0
hero_count2 = 0
avrg = 0

CSV.open(ARGV[0], "r").each do |row|
	if  row[1] == ARGV[1]
		price1 = price1 + row[3].to_i
		hero_count1 = hero_count1 + 1
	end
	if  row[1] == ARGV[2]
		price2 = price2 + row[3].to_i
		hero_count2 = hero_count2 + 1
	end
end

CSV.open(ARGV[0], "r").each do |row|
	if price1/hero_count1 > price2/hero_count2
		if row[1] == ARGV[1]
			sorting_array << row
			name = ARGV[1]
			avrg = price1/hero_count1
		end
	else
		if row[1] == ARGV[2]
			sorting_array << row
			name = ARGV[2]
			avrg = price2/hero_count2
		end
	end
end

sorting_array = sorting_array.sort_by do
	|a,b,c,e| e.to_i
end
CSV.open("#{name.split("/")[0] + " " + name.split("/")[1] + " - " + avrg.to_s}.csv", "w+") do |csv|
	while i < sorting_array.length
		csv << sorting_array[i]
		i = i + 1
	end
end
