require 'csv'

# vavejdash marka i cena i ti dava sichko koeto mojesh da si kypish

array=Array.new()
product=ARGV[1]
price=ARGV[2].to_i
CSV.foreach(ARGV[0]) do |row|
	if (row[0] == product && row [2].to_i <= price)
	array << [row[1],row[2],row[3]]
	end
end
array.sort!{|a,b| a[1].to_i <=> b[1].to_i}
CSV.open("family_results.csv" , "w") do |csv|
	array.each do |element|
		csv << element
	end
end
