require 'csv'

array = Array.new()
CSV.foreach("bpl.csv") do |row|
	wins = row[2].to_i
	losses = row[4].to_i
	difference = wins - losses
	if difference < ARGV[0].to_i
		array << [row[1], difference.to_s]
	end
end

array = array.sort_by { |array| array[1].to_i }

CSV.open("#{array[0]}_result.csv", "w") do |csv|
	array.each do |element|
		csv << element
	end
end
