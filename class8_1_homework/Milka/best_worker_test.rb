begin
check = system "ruby #{ARGV[0]} jobs.csv"
result = `diff -q test_data/best_worker_expected.csv result.csv`
if result == ""
	p true 
else
	p false
end
rescue Exeption => e
	p e
end
