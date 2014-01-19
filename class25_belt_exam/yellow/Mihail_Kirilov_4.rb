require 'csv'
arr = []

CSV.foreach("stats.csv") do |row|
	if row[1].to_i > ARGV[0].to_i
		arr << row
	end
end

least_loses = arr.sort_by {|a,b,c,d,e,f,g,h| h.to_i}

CSV.open("top.csv", "w") do |io|
	if ARGV[1] != nil
		count = 0
		new_arr = least_loses.sort_by {|a,b,c,d,e,f| d.to_i}
		if ARGV[1].to_i <= least_loses.count
			ARGV[1].to_i.times do
				io << new_arr[count]
				count = count + 1
			end
		else
			new_arr.each do |element|
				io << element
			end
		end
	else
		count = 0 
		new_arr = least_loses.sort_by { |a, b,c,d,e,f| d.to_i  }
		5.times do
			io << new_arr[count]
			count = count + 1
		end
	end
end