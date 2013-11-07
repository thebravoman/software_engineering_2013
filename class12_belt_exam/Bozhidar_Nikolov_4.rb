require 'csv'

array = Array.new

CSV.foreach(ARGV[0]) do |row|
	if row[1].downcase == ARGV[1].to_s.downcase
		array << row
	end
end

array = array.sort_by { |array| array[2].to_i }

CSV.open("laptops_processor_result.csv", "w") do |csv|
	array.each do |element|
		csv << element
	end
end
