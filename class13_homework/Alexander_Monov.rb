#/usr/bin/ruby

require 'set'
require 'rexml/document'

d = REXML::Document.new
r = d.add_element( 'svg' )
r.attributes['version'] = '1.1'
r.attributes['xmlns'] = 'http://www.w3.org/2000/svg'

l = r.add_element('line')
l.attributes['x1'] = 0
l.attributes['y1'] = 350
l.attributes['x2'] = 2000
l.attributes['y2'] = 350
l.attributes['style'] = 'stroke: rgb( 0, 0, 0 ); stroke-width: 2;'

l = r.add_element('line')
l.attributes['x1'] = 600
l.attributes['y1'] = 0
l.attributes['x2'] = 600
l.attributes['y2'] = 2000
l.attributes['style'] = 'stroke: rgb( 0, 0, 0 ); stroke-width: 2;'


s = Set.new [0, 1 << 24 - 1]
ARGV.map! { |i| i.to_f }
ARGV.each_slice(3) do |p|                                                        
        a, b, c = p
        
        xv = -b / (2.0 * a)
        yv = a*xv*xv + b*xv + c
        
        x1 = xv - 600.0
        y1 = a*x1*x1 + b*x1 + c
        
        x2 = xv + 600.0
        y2 = a*x2*x2 + b*x2 + c

        xc = 2.0 * xv - (x1 + x2) / 2.0
        yc = 2.0 * yv - (y1 + y2) / 2.0

        x1 += 600.0
        x2 += 600.0
        xc += 600.0
        y1 = -y1 + 350.0
        y2 = -y2 + 350.0
        yc = -yc + 350.0

        l = r.add_element('path')
        l.attributes['d'] = "M #{x1.to_i} #{y1.to_i} Q #{xc.to_i} #{yc.to_i} #{x2.to_i} #{y2.to_i}"

        c = 0
        c = rand(1 << 24) while s.include?(c)
        s.add(c)
        red = c >> 16
        green = (c >> 8) & 0xFF
        blue = c & 0xFF

        l.attributes['style'] = 'stroke: rgb( ' << red.to_s << ', ' << green.to_s << ', ' << blue.to_s << ' ); stroke-width: 1;'
        l.attributes['fill'] = 'none'
end

File.open('Alexander_Monov.svg', 'w') do |f|
        f.write(d.to_s)
end
