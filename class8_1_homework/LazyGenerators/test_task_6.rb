#!/usr/bin/ruby

require 'csv'

FILES = ['stats_example.csv', 'stats_trimmed.csv', 'player_stats.csv']

def do_task( input )
	a = []
	CSV.foreach( input ) do |r|
		s = r[5].to_i + r[6].to_i + r[7].to_i
		a << [r[0], r[3], r[5], r[6], r[7], s, s - r[3].to_i] if s != r[3].to_i
	end
	a
end

def do_test( input )
	begin
		r = true
		FILES.each do |f|
			exp = do_task( f )
			`ruby #{input} #{f} out.csv`
			r = exp == CSV.read( 'out.csv' )
			break unless r
		end
		r
	rescue
		false
	end
end

puts do_test( ARGV[0] )
