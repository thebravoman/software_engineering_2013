require 'csv'

i=0
`ruby #{ARGV[0]} currency.csv 1.1`
result = `diff -q currency_results.csv currency_expected.csv`
	if result==""
		i=1
	end
`ruby #{ARGV[0]} currency.csv 1.1 KYD`
result = `diff -q currency_results.csv currency_expected2.csv`
	if result==""
		i=1
	else i=0 end

CSV.open("result.csv","w") do |csv|
	csv << [ARGV[0],i==1]
end
