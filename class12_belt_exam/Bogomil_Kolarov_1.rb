require 'csv'
require 'date'

file_name = ARGV[0]
note = ARGV[1]
result_name = ARGV[2]
hash = {}
arr = []
h = {}
CSV.foreach(file_name, "r") do |row|
	if row[5] == note
		hash[row[5]] = row
		next if h[row[1]] == row[5]
		arr << hash[row[5]]
	end	
end

#arr.sort_by { |Date.parse()| }


#result_name = file_name.split('.csv')

CSV.open(result_name, "wb") do |f|
	arr.each do |x|
		f << x
	end
end
