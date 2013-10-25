begin
check = system "ruby #{ARGV[0]} jobs.csv"
result = `diff -q test_data/jobs_young_expected.csv result.csv`
if result == ""
	p true 
else
	p false
end
rescue Exeption => e
	p e
end
