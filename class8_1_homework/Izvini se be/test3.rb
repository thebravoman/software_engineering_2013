`ruby #{ARGV[0]} stolen_champs.csv Assassin/Support Mage/Support`
differences = ""
file_name = ""
if File.exists?("Mage Support - 3633.csv")
	file_name = "Mage Support - 3633.csv"
	differences = `diff '#{file_name}' expected_test3.csv`
	if differences == ""
		p true
	else
		p false
	end
	`rm 'Mage Support - 3633.csv'`
else
	p false
end