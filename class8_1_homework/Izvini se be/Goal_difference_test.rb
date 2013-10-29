require 'csv'

`ruby Goal_difference.rb Fulham`
program_result = ""
expected_result = ""
if File.exists?("Fulham_result.csv")
	File.open("Fulham_result.csv", "r").each do |line|
		program_result += line
	end
	File.open("Fulham_result_expected.csv", "r").each do |line|
		expected_result += line
	end
	if program_result == expected_result
		p "true"
	else
		p "false"
	end
else
	p "false"
end
