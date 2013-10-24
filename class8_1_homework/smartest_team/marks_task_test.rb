require 'csv'

`ruby #{ARGV[0]} task4.csv`
result=`diff -q task4_result.csv task4_expected.csv`

CSV.open("result.csv","w") do |csv|
	csv << [ARGV[0],result==""]
end
