require 'csv'

`ruby #{ARGV[0]} sales.csv`
result = `diff -q sales_results.csv sales2_e_results.csv`

CSV.open("result.csv","w") do |csv|
	csv << [ARGV[0],result == ""]
end
