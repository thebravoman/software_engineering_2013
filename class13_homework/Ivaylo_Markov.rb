require "rexml/document"

def bezier_quad x1,y1,xc,yc,x2,y2, el_svg
			b = el_svg.add_element "path"
			b.attributes["d"] = "M #{x1.to_i} #{y1.to_i} Q #{xc.to_i} #{yc.to_i} #{x2.to_i} #{y2.to_i}"
			b.attributes["fill"] = "none"
			b.attributes["stroke"] = "blue"
			b.attributes["stroke-width"] = "2"
end

def line x1,y1,x2,y2, el_svg
	l = el_svg.add_element "line"
    l.attributes["x1"] = x1
    l.attributes["x2"] = x2
    l.attributes["y1"] = y1
    l.attributes["y2"] = y2
    l.attributes["stroke"] = "black"
    l.attributes["stroke-width"] = "2"
end

def quad a,b,c,x
	a*x*x + b*x + c
end
        
a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f

xv = -b /(2*a)
yv = quad a,b,c,xv

x1 = xv - 600
y1 = quad a,b,c,x1
	
x2 = xv + 600
y2 = quad a,b,c,x2

xv = 2* xv - ( x1 + x2 ) /2
yv = 2* yv - ( y1 + y2 ) /2

x1 += 600.0
	x2 += 600.0
	xv += 600.0
	y1 = -y1 + 350.0
	y2 = -y2 + 350.0
	yv = -yv + 350.0

doc = REXML::Document.new
el_svg = doc.add_element "svg"
el_svg.attributes["version"] = "1.1"
el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"

line 0,600,2000,600,el_svg
line 600,0,600,2000,el_svg

bezier_quad x1,y1,xv,yv,x2,y2, el_svg
File.open("Ivaylo_Markov.svg", "w") do |f|
                        f.write(doc.to_s)
                end











