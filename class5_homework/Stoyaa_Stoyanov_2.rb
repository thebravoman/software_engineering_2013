obrazec = /^\d\d:\d\d:\d\d,\d\d\d\s*-->\s*\d\d:\d\d:\d\d,\d\d\d\s*$/

array_for_the_first_half = ""
array_for_the_second_half = ""

File.open(ARGV[0],"r").each do |line|
	
	if line =~ obrazec
			all = line.split("-->") [0..1]
	
		if array_for_the_first_half.empty?
			array_for_the_first_half = all[0].strip
		end
	
		if array_for_the_second_half.empty?
			array_for_the_first_half = all[1].strip
		end
	end
end

array1 = array_for_the_first_half.split(",")
array2 = array_for_the_second_half.split(",")

array_first = array1[1].split(":").first
array_second = array2[1].split(":").second

	first = (array1[0].to_i)*60*60*1000*1000*1000 + (array1[1].to_i)*60*1000*1000*1000 + (array_first[0].to_i)*1000*1000*1000 + (array_first[1].to_i)*1000*1000
	second = (array2[0].to_i)*60*60*1000*1000*1000 + (array2[1].to_i)*60*1000*1000*1000 + (array_second[0].to_i)*1000*1000*1000 + (array_second[1].to_i)*1000*1000
#result = second - first
puts second - first
