require 'csv'

arr = []
filename = ARGV[0]
cifri = ARGV[1]
	CSV.foreach(filename) do |row|
	n = row[4].to_s
	if n.include? cifri.to_s 
	arr << row
	end
end

	arr = arr.sort_by{|a| a[1].to_i}
	
	CSV.open("momicheta_result.csv" , "wb") do |csv|
		 arr.each do |element|
		 csv << element
	 end
end
