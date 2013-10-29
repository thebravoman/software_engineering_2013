require "csv"

begin
	max_1 = 0
	i = 0
	
	CSV.foreach(ARGV[0]) do |row|
		for i in 0...5		
			if row[i].to_i > max_1
				max_1 = row[i].to_i
			end
		end
	end
	max_2 = 0

	CSV.foreach(ARGV[1]) do |row|
		for i in 0...5		
			if row[i].to_i > max_2
				max_2 = row[i].to_i
			end
		end
	end

	max = 0

	if max_1 > max_2
		max = max_1
	else
		max = max_2
	end
	
File.open("task_2_result.txt", "wb") do |file|
	file << max_1
	file << ","	
	file << max_2
	file << ","	
	file << max
end

end
