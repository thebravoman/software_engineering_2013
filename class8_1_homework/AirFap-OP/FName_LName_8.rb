require 'csv'
i = 0
arr = []
CSV.foreach("#{ARGV[1]}") do |row|
	i+=row[0].to_i+row[1].to_i
end
CSV.foreach("#{ARGV[0]}") do |row|
	if row[1] != nil
		row[1] = row[1].gsub("_"," ")
	end
	if i%2 == 0
		if row[0].to_i%2 ==0
			arr << row if row[3].strip.gsub(" km","").to_i > 200
		end
	else
		if row[0].to_i%2 !=0
			arr << row if row[3].strip.gsub(" km","").to_i > 200
		end
	end
end
arr = arr.sort{|a,b| a[2] <=> b[2]}
CSV.open("FName_LName_8.csv","w") do |csv|
	arr.each do |element|
		for i in 0..5
			element[i] = element[i].strip
		end		
		csv << element
	end
end
