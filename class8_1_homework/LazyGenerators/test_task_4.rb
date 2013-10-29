#!/usr/bin/ruby

require 'csv'

TIMES = 100
FILES = ['stats_example.csv', 'stats_trimmed.csv', 'player_stats.csv']

def do_task( input, id )
	id = id.to_i
	a = CSV.read( input )
	a.sort_by! { |e| [e[1].to_i, e[0].to_i] }
	return [] unless i = a.find_index{ |e| e[0].to_i == id }
	b = i-5
	b = 0 if b < 0
	a = a.slice( b..( i+5 ) )
end

def do_test( input, count )
	begin
		r = true
		FILES.each do |f|
			count.times do
				c = rand(176189)
				exp = do_task( f, c )
				`ruby #{input} #{f} #{c} out.csv`
				r = exp == CSV.read( 'out.csv' )
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
