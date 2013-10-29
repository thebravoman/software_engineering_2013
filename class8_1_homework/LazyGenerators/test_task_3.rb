#!/usr/bin/ruby

require 'csv'

TIMES = 3
FILES = ['stats_example.csv', 'stats_trimmed.csv', 'player_stats.csv']

def do_task( input, count )
	a = []
	CSV.foreach( input ) do |r|
		a << r
		a.sort_by! { |e| [e[1].to_i, e[0].to_i] }.reverse!
		a = a.take( count )
	end
	a
end

def do_test( input, count )
	begin
		r = true
		FILES.each do |f|
			count.times do
				c = rand(1000)
				exp = do_task( f, c )
				`ruby #{input} #{f} #{c}`
				r = exp == CSV.read( 'top.csv' )
				break unless r
			end
			break unless r
		end
		r
	rescue
		false
	end
end

puts do_test( ARGV[0], TIMES )
