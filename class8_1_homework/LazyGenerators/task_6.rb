#!/usr/bin/ruby

require 'csv'

def do_task( input, output )
	CSV.open( output, 'wb' ) do |csv|
		CSV.foreach( input ) do |r|
			s = r[5].to_i + r[6].to_i + r[7].to_i
			csv << [r[0], r[3], r[5], r[6], r[7], s, s - r[3].to_i] if s != r[3].to_i
		end
	end
end

do_task( ARGV[0], ARGV[1] )
