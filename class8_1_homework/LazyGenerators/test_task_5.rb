#!/usr/bin/ruby

require 'csv'

FILES = ['stats_example.csv', 'stats_trimmed.csv', 'player_stats.csv']

def do_task( input )
	a = CSV.read( input )
	a.map! { |e| e.take( 3 ) }
	a.sort_by! { |e| [e[1].to_i, e[2].to_i, e[0].to_i] }
	avg = 0.0
	a.each { |e| avg += e[1].to_f }
	avg /= a.count
	b = a.take_while{ |e| e[1].to_f < avg }
	c = a.drop_while{ |e| e[1].to_f < avg }
	c.reverse!

	[c,b]
end

def do_test( input )
	begin
		r = true
		FILES.each do |f|
			exp = do_task( f )
			`ruby #{input} #{f} top.csv bottom.csv`
			r = exp[0] == CSV.read( 'top.csv' )
			r &= exp[1] == CSV.read( 'bottom.csv' )
			break unless r
		end
		r
	rescue
		false
	end
end

puts do_test( ARGV[0] )
