require 'csv'

`ruby #{ARGV[0]} sales.csv 06:20`
result = `diff -q sales_e_results.csv sales_results.csv`
CSV.open("result.csv","w") do |csv|
	csv << [ARGV[0],result==""]
end
