require 'csv'

`ruby #{ARGV[0]} task2.csv`
result=`diff -q task2_result.csv task2_expected.csv`

CSV.open("result.csv","w") do |csv|
	csv << [ARGV[0],result==""]
end
