begin
check = system "ruby #{ARGV[0]} basketball.csv 22/10/2013"
result = `diff -q test_data/date_win_expected.csv result.csv`
if result == ""
	p true 
else
	p false
end
rescue Exeption => e
	p e
end
