require 'csv'

found = []
i = 0
CSV.foreach(ARGV[0]) do |row|
	if row[2] == nil
		row[2] = " "
	end

	if row[4][0..2] == ARGV[1]
		found[i] = row
		i += 1
	end
end
found.sort {|a, b| a[2].to_i <=> b[2].to_i}
filename = ARGV[0] + '_results.csv'
CSV.open(filename) do |csv|
	found.each do |array|
		csv << array
	end
p filename
