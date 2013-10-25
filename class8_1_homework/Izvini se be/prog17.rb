require 'csv'

the_price = 0

CSV.open(ARGV[0], "r").each do |row|
	if (row[0] == "champ_#{ARGV[1]}")
		the_price = row[3].to_i
	end
end

j = 0
sorting_array = Array.new()

CSV.open("temp.csv", "w") do |csv|
	CSV.open(ARGV[0], "r").each do |row|
		if (row[3].to_i < the_price.to_i)
			sorting_array << row
			j = j + 1
		end
	end
	sorting_array = sorting_array.sort_by do
		|a,b,c,e| e.to_i
	end
	
	i = 0
	
	while (i < sorting_array.length)
		csv << sorting_array[i]
		i = i + 1
	end
end

File.rename("temp.csv", "#{j + 1}.csv")
