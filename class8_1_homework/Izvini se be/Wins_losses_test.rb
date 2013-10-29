require 'csv'

`ruby Wins_losses.rb 2`
if File.exists?("Sunderland_result.csv")
	result = `diff Sunderland_result.csv Sunderland_result_expected.csv`
	result = result.gsub(/\n/, "")
	if result == ""
		p "true"
	else
		p "false"
	end
else
	p "false"
end
