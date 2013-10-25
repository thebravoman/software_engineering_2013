require "csv"

begin

total_1 = 0
total_2 = 0
i = 0

CSV.foreach(ARGV[0]) do |row|
	for i in 0...5
		total_1 = total_1 + row[i].to_i
	end
end

CSV.foreach(ARGV[1]) do |row|
	for i in 0...5
		total_2 = total_2 + row[i].to_i
	end
end

total = total_1 + total_2

File.open("task_1_result.txt", "wb") do |file|
	file << total
end

end
