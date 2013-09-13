#!/usr/local/bin/ruby -w
if ARGV.empty?
	puts "Input file not specified!"
elsif File.exists?(ARGV[0])
	print File.open(ARGV[0]).read.scan(/-->/).count
else
	puts "File #{ARGV[0]} not found!"
end