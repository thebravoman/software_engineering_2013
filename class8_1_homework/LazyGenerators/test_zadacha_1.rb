require 'csv'

	str = "ruby " + ARGV[0] + " data_zad1_2/text.txt"
	%x[#{str}]
	res = %x[diff results.csv data_zad1_2/results_expected.csv]
	if res.length > 0
		puts res
		exit(0)
	end
puts "true"