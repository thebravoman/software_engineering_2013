require "csv"

class_wow = ""
lvl_sum = 0
CSV.foreach(ARGV[0]) do |row|
	if ARGV[1] == "horde"
		if row[0].to_s == "horde"
			class_wow += row.to_s + "\n"
			lvl_sum = row[4].to_i + lvl_sum 
		end
	end
	if ARGV[1] == "alliance"
		if row[0].to_s == "alliance"
			class_wow += row.to_s + "\n"
			lvl_sum = row[4].to_i + lvl_sum 
		end
	end
end


File.open("result.csv", "w") do |file|
	#class_wow.each do |element|
	#	file << element
	#end
	file << class_wow.to_s
	file << lvl_sum
end
