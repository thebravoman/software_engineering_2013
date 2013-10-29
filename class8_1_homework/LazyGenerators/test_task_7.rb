#!/usr/bin/ruby

require 'csv'

FILE = 'player_stats.csv'

def do_test( input )
	begin
		`ruby #{input} #{FILE} out.csv`
		a = CSV.read( 'out.csv' )
		used = []
		a.each { |e| used << e[0..4] }
		used.flatten!.uniq!
		return false if used.count != 16*5
		a.sort_by! { |e| e[5].to_f }
		return false if a.count != 16
		return false if ( a.first[5].to_f - a.last[5].to_f ).abs >= 10.0

		h = {}
		t = CSV.read( FILE )
		t.each { |e| h[e[0].to_i] = e }
		t = []
		
		a.each do |e|
			avg = 0.0
			e[0..4].each { |x| avg += h[x.to_i][1].to_f }
			avg /= 5.0
			return false if avg != e[5].to_f
		end
		true
	rescue
		false
	end
end

puts do_test( ARGV[0] )
