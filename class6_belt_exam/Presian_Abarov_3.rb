#!/usr/bin/ruby

require 'csv'
require 'date'

all = []
arg = ARGV[1].to_f

CSV.foreach(ARGV[0]) do |row|
	next if row[2].nil?
	next unless row[2].to_f > arg
	all << row
end

all = all.sort{ |x,y| x[2].to_f <=> y[2].to_f }
all = all.reverse()

CSV.open(ARGV[0]+"_result.csv","wb") do |csv|
	all.each do |x|
		csv << x
	end
end
