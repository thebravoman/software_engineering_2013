#!/usr/bin/ruby

require 'csv'

h = Hash.new( 0.0 )
h[""] = 0.0
CSV.foreach( 'bank.csv' ) do |r|
	h[r[0]] += r[1].to_f
end
puts ( h.max_by { |k,v| v } )[0]

