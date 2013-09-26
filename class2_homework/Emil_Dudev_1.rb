#!/usr/bin/ruby

require 'csv'
require 'date'

s = Date.strptime( ARGV[0], '%d/%m/%Y' )
e = Date.strptime( ARGV[1], '%d/%m/%Y' )
c = 0.0
d = 0.0
CSV.foreach('bank.csv') do |r|
	t = Date.strptime( r[0], '%d/%m/%Y' )
	if t >= s && t <= e
		d += r[1].to_f
		c += r[2].to_f
	end
end
printf "%.2f,%.2f,%.2f\n", d, c, d-c

