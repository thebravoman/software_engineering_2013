#!/usr/bin/ruby

require 'set'
require 'rexml/document'

d = REXML::Document.new
r = d.add_element( 'svg' )
r.attributes['version'] = '1.1'
r.attributes['xmlns'] = 'http://www.w3.org/2000/svg'

l = r.add_element( 'line' )							# draw the X axis
l.attributes['x1'] = 0
l.attributes['y1'] = 350
l.attributes['x2'] = 2000
l.attributes['y2'] = 350
l.attributes['style'] = 'stroke: rgb( 0, 0, 0 ); stroke-width: 2;'

l = r.add_element( 'line' )							# draw the Y axis
l.attributes['x1'] = 600
l.attributes['y1'] = 0
l.attributes['x2'] = 600
l.attributes['y2'] = 2000
l.attributes['style'] = 'stroke: rgb( 0, 0, 0 ); stroke-width: 2;'


s = Set.new [0, 1 << 24 - 1]
ARGV.map! { |i| i.to_f }
ARGV.each_slice( 3 ) do |p|							
	# take every 3 arguments and make a quadratic graph out of them
	# f(x) = a*x^2 + b*x + c
	a, b, c = p
	
	# find the peak of the graph
	xv = -b / ( 2.0 * a )
	yv = a*xv*xv + b*xv + c
	
	# set left boundary
	x1 = xv - 600.0
	y1 = a*x1*x1 + b*x1 + c
	
	# set right boundary
	x2 = xv + 600.0
	y2 = a*x2*x2 + b*x2 + c

	# find the control point for the quadratic Bezier curve
	# Pv = ( xv; yv ), Pc = ( xc; yc ), P1 = ( x1; y1 ), P2 = ( x2; y2 )
	# from wikipedia: P = (1-t)^2*P1 + 2*(1-t)*t*Pc + t^2*P2
	# Pv is at t = 1/2, so...
	# Pv = 1/4*P1 + 1/2*Pc + 1/4*P2
	# and from there, we can find Pc
	# Pc = 2*Pv - ( P1 + P2 )/2

	xc = 2.0 * xv - ( x1 + x2 ) / 2.0
	yc = 2.0 * yv - ( y1 + y2 ) / 2.0

	# move everything to the center (600;350)
	x1 += 600.0
	x2 += 600.0
	xc += 600.0
	y1 = -y1 + 350.0
	y2 = -y2 + 350.0
	yc = -yc + 350.0

	l = r.add_element( 'path' )
	l.attributes['d'] = "M #{x1.to_i} #{y1.to_i} Q #{xc.to_i} #{yc.to_i} #{x2.to_i} #{y2.to_i}"

	c = 0									# choose a color
	c = rand( 1 << 24 ) while s.include?( c )
	s.add( c )
	red = c >> 16
	green = ( c >> 8 ) & 0xFF
	blue = c & 0xFF

	l.attributes['style'] = 'stroke: rgb( ' << red.to_s << ', ' << green.to_s << ', ' << blue.to_s << ' ); stroke-width: 1;'
	l.attributes['fill'] = 'none'
end

File.open( 'Emil_Dudev.svg', 'w' ) do |f|
	f.write( d.to_s )
end
