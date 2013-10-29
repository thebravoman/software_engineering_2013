begin
check = system "ruby #{ARGV[0]} basketball.csv MIA"
result = `diff -q test_data/favourite_team_expected.csv result.csv`
if result == ""
	p true 
else
	p false
end
rescue Exeption => e
	p e
end
