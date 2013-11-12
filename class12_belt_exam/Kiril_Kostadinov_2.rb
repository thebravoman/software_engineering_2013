require 'csv'

if ARGV[1] == nil
	count = 5
else
	count = ARGV[1].to_i
end
stats = []
i = 0
CSV.foreach(ARGV[0]) do |row|
	stats[i] = row
	i += 1
end
sorted = stats.sort {|a, b| [a[2].to_i, a[0].to_i] <=> [b[2].to_i, b[0].to_i]}
sorted.reverse!
i = 0
CSV.open("top.csv", "w") do |csv|
	while i < count && i < sorted.length do 
		csv << sorted[i]
		i += 1
	end
end
	
