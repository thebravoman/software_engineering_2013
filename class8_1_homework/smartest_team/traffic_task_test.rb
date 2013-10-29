require 'csv'

`ruby #{ARGV[0]} task5.csv 20`
result = `diff -q task5_expected.csv task5_result.csv`

CSV.open("result.csv","w") do |csv|
	csv << [ARGV[0],result == ""]
end
