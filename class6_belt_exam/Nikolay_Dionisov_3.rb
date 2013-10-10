
require 'csv'

debit_min = ARGV[1].to_f
results = {}
CSV.foreach(Dir.pwd + "/" + ARGV[0]) do |row|
	next if row[2] == nil
	next if row[2].to_f <= debit_min
	results[row[0]] = row
end

results = results.sort_by { |a,b| b[2].to_f }
results = results.reverse()

CSV.open(Dir.pwd + "/" + ARGV[0].split(".csv")[0] + "_results.csv", "w") do |csv|
	results.each() do |el|
		csv << el[1]
	end
end
