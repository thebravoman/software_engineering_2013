require 'csv'

array = Array.new()
argv = ARGV[1]

CSV.foreach(ARGV[0]) do |row|
	if argv == row[0]
		array << [row[1],row[2]]
	end
end

array.sort!{|a,b| a[1].to_i <=> b[1].to_i}

CSV.open("ekip_result.csv","w") do |csv|
	array.each do |element|
	csv << element
	end
end
