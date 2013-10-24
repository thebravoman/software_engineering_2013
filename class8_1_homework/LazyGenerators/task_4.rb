#!/usr/bin/ruby

require 'csv'

def do_task( input, output, id )
	id = id.to_i
	File.open( output, 'w' )
	a = CSV.read( input )
	a.sort_by! { |e| [e[1].to_i, e[0].to_i] }
	return unless i = a.find_index{ |e| e[0].to_i == id }
	b = i-5
	b = 0 if b < 0
	a = a.slice( b..( i+5 ) )
	CSV.open( output, 'wb' ) do |c|
		a.each { |e| c << e }
	end
end

do_task( ARGV[0], ARGV[2], ARGV[1] )
