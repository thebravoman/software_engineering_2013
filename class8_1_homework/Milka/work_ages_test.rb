begin
check = system "ruby #{ARGV[0]} jobs.csv programer 20 40"
result = `diff -q test_data/work_ages_expected.csv result.csv`
if result == ""
	p true 
else
	p false
end
rescue Exeption => e
	p e
end
