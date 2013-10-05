#!/usr/bin/ruby

require 'csv'

all = {}

CSV.foreach(ARGV[0] + "eval.csv") do |row|
	next if row[0].to_s.length != 1
	next if row[3].nil?
	all[row[3]] = [row[1] + " " + row[2]]
end

Dir.glob(ARGV[0] + "results*") do |resultsX_csv|
	CSV.foreach(resultsX_csv) do |row|
		names = row[0].split("_")[0..1]
		name = names[0] + " " + names[1]
		next unless all.has_key?(name)
		all[name] << res = row[2] == "true"? 1:0	
	end
end

all = all.sort_by { |key, value| key }

CSV.open("results1.csv","wb") do |csv|
	all.each do |key, value|
		csv << value
	end
end
