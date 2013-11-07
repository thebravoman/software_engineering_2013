require 'csv'

sorting_array = Array.new()

CSV.open(ARGV[0], "r").each do |row|
	if row[1].downcase == ARGV[1].downcase
		sorting_array << row
	end
end

sorting_array = sorting_array.sort_by do
	|a, b, c, d, e, f| c
end

i = 0

CSV.open("laptops_processor_result.csv", "w") do |file|
	while i < sorting_array.length
		file << sorting_array[i]
		i = i + 1;
	end
end
