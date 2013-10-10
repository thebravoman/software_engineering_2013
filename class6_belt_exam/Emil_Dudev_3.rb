#!/usr/bin/ruby

require 'csv'

a = []
d = ARGV[1].to_f
CSV.foreach( ARGV[0] ) do |l|
	a << l if l[2].to_f > d
end
a = a.sort { |e2,e1| e1[2].to_f <=> e2[2].to_f }
CSV.open( ARGV[0].split( '.csv' )[0] + '_result.csv', 'wb' ) do |c|
	a.each { |e| c << e }
end

