require "csv"

begin

brand = ARGV[1]
i = 0
array_strings = []

CSV.foreach("laptops.csv") do |element|
	if brand == element[i]
		array_strings[i] = element
	end
		i = i + 1	
end

File.open("laptops_processor_result.csv", "w") do |file|
	file << array_strings << "\n"
end

end
