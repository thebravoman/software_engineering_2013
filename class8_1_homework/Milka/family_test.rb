begin
check = system "ruby #{ARGV[0]} sport.csv Adidas 130.00"
result = `diff -q test_data/family_expected.csv results.csv`
if result == ""
	p true 
else
	p false
end
rescue Exeption => e
	p e
end
