require 'csv'

`ruby #{ARGV[0]} countrylist.csv`
result=`diff -q country_results.csv country_e_results.csv`

CSV.open("result.csv","w") do |csv|
	csv << [ARGV[0],result==""]
end
