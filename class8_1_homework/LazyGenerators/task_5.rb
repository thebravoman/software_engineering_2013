#!/usr/bin/ruby

require 'csv'

def do_task( input, output1, output2 )
	a = CSV.read( input )
	a.sort_by! { |e| [e[1].to_i, e[2].to_i, e[0].to_i] }
	avg = 0.0
	a.each { |e| avg += e[1].to_f }
	avg /= a.count
	b = a.take_while{ |e| e[1].to_f < avg }
	c = a.drop_while{ |e| e[1].to_f < avg }
	c.reverse!

	CSV.open( output1, 'wb' ) do |f|
		c.each { |e| f << e }
	end
	CSV.open( output2, 'wb' ) do |f|
		b.each { |e| f << e }
	end
end

do_task( ARGV[0], ARGV[1], ARGV[2] )
