begin
check = system "ruby #{ARGV[0]} jobs.csv programer"
result = `diff -q test_data/jobs_info_expected.csv result.csv`
if result == ""
	p true 
else
	p false
end
rescue Exeption => e
	p e
end
