require "csv"
num = ARGV[1].to_s
arr = []

CSV.foreach(ARGV[0]) do |row|
	if row[4].to_s.include? num
		arr << row
	end
end

arr=arr.sort_by{|a,b|b}

CSV.open("momicheta_result.csv","w") do |csv|
arr.each do |element|
	csv << element
end
end
