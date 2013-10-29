`ruby #{ARGV[0]} stolen_champs.csv Lissandra`

if (File.exists?("84.csv"))
	if `diff expected_17.csv 84.csv`!= ""
		p false
	else
		p true
	end
	`rm 84.csv`
else
	p false
end