require 'csv'

names = []
i = 0
popravka = 0

CSV.open(ARGV[0], "r").each do |row|
	row.each do |element|
	 	if element.to_i == 2
	 		popravka = 1
		end
	end	
	if popravka == 1
		names[i] = [row[1] + " " + row[2], "Yes"] # Dvumenren masiv...
	else
		names[i] = [row[1] + " " + row[2], "No"]
	end
	i += 1
	popravka = 0
end

names = names.sort_by {|a,b| a}

CSV.open(ARGV[1], "w") do |csv|
	names.each do |el|
		csv << el
	end
end	
