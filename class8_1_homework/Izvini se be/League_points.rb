require 'csv'

array = Array.new()
CSV.foreach("bpl.csv") do |row|
	if row[0].to_i >= ARGV[0].to_i && row[0].to_i <= ARGV[1].to_i
		if row[6].to_i != ARGV[2].to_i
			array << [row[0], row[1], row[2], row[3], row[4], row[5], row[6]]
		end
	end
end

array = array.sort_by { |array| array[3].to_i }
array = array.reverse

losses = array[0][4].to_i
array.each do |element|
	if element[4].to_i < losses
		losses = element[4].to_i
	end
end

CSV.open("2.csv", "w") do |csv|
	array.each do |element|
		csv << element
	end
end


