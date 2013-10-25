require 'csv'

`ruby League_points.rb 6 13 10`
if File.exists?("1.csv")
	result = `diff 1.csv 1_expected.csv`
	result = result.gsub(/\n/, "")
	if result == ""
		p "true"
	else
		p "false"
	end
else
	p "false"
end
