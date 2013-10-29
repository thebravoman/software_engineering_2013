require 'csv'

`ruby Debit.rb 08`
month_results = ""
month_results_expected = ""
if File.exists?("month_results.csv")
	File.open("month_results.csv", "r").each do |line|
		month_results += line
	end
	File.open("month_results_expected.csv", "r").each do |line|
		month_results_expected += line
	end
	if month_results == month_results_expected
		p "true"
	else
		p "false"
	end
else
	p "false"
end
