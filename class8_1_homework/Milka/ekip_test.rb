begin
check = system "ruby #{ARGV[0]} sport.csv Nike"
result = `diff -q test_data/ekip_expected.csv result.csv`
if result == ""
	p true 
else
	p false
end
rescue Exeption => e
	p e
end
