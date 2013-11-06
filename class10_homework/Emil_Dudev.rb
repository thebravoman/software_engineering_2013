#!/usr/bin/ruby

require 'set'
require 'rexml/document'

d = REXML::Document.new
r = d.add_element( 'svg' )
r.attributes['version'] = '1.1'
r.attributes['xmlns'] = 'http://www.w3.org/2000/svg'

l = r.add_element( 'line' )
l.attributes['x1'] = 0
l.attributes['y1'] = 350
l.attributes['x2'] = 2000
l.attributes['y2'] = 350
l.attributes['style'] = 'stroke: rgb( 0, 0, 0 ); stroke-width: 2;'

l = r.add_element( 'line' )
l.attributes['x1'] = 600
l.attributes['y1'] = 0
l.attributes['x2'] = 600
l.attributes['y2'] = 2000
l.attributes['style'] = 'stroke: rgb( 0, 0, 0 ); stroke-width: 2;'

s = Set.new [0, 1 << 24 - 1]
ARGV.map! { |i| i.to_f }
ARGV.each_slice( 2 ) do |p|
	l = r.add_element( 'line' )
	x1 = -1200.0
	y1 = p[0]*x1 + p[1]
	x2 = 1200.0
	y2 = p[0]*x2 + p[1]

	x1 += 600.0
	x2 += 600.0
	y1 = -y1 + 350.0
	y2 = -y2 + 350.0

	l.attributes['x1'] = x1
	l.attributes['y1'] = y1
	l.attributes['x2'] = x2
	l.attributes['y2'] = y2

	c = 0
	c = rand( 1 << 24 ) while s.include?( c )
	s.add( c )
	red = c >> 16
	green = ( c >> 8 ) & 0xFF
	blue = c & 0xFF

	l.attributes['style'] = 'stroke: rgb( ' << red.to_s << ', ' << green.to_s << ', ' << blue.to_s << ' ); stroke-width: 1;'
end

File.open( 'Emil_Dudev.svg', 'w' ) do |f|
	f.write( d.to_s )
end
