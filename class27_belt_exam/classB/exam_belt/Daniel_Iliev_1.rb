require "csv"

	filename = ARGV[0]
	max = 0
	mid = 0
	min = 0
	
	CSV.foreach(filename) do |row|
		max = row[2]
		CSV.foreach(filename) do |element|
			if element[2] > max
				max = element
			end
		end
		CSV.open("champs_result.csv", "wb") do |csv|
			csv << max
		end
	end
	
	CSV.foreach(filename) do |row|
		min = row[2]
		CSV.foreach(filename) do |element|
			if element[2] < min
				min = element
			end
		end
	end

	CSV.foreach(filename) do |row|
		CSV.foreach(filename) do |element|
			if element[2] < max && element[2] > min
				mid = element[2]
			end
		end
	end
	
	puts max
	puts mid
	puts min
