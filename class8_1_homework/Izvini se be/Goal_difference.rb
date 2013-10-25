require 'csv'

team_gd = 0
CSV.foreach("bpl.csv") do |row|
	if row[1].to_s == ARGV[0]
		team_gd = row[5].to_i
	end
end
array = Array.new()
CSV.foreach("bpl.csv") do |row|
	if row[5].to_i > team_gd
		array << [row[0], row[1], row[2], row[3], row[4], row[5], row[6]]
	end
end

array = array.sort_by { |array| array[0].to_i }

CSV.open("#{ARGV[0]}_result.csv", "w") do |csv|
	array.each do |element|
		csv << element
	end
end
