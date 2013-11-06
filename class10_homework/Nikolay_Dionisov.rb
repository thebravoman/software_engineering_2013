exit(0) if ARGV.length.odd?
exit(0) if ARGV.length < 0
pairs = []
i = 0
while i < ARGV.length
	pairs << [ARGV[i].to_i, ARGV[i+1].to_i]
	i += 2
end


require 'rexml/document'

def draw_line(d, a,b, c)
	l = d.add_element "line"
	l.attributes["x1"] = a[0]
	l.attributes["y1"] = a[1]
	l.attributes["x2"] = b[0]
	l.attributes["y2"] = b[1]
	l.attributes["style"] = "stroke:rgb(#{c[0]},#{c[1]},#{c[2]});strike-width:2"
end
doc = REXML::Document.new
svgc = doc.add_element "svg"
svgc.attributes["version"] = "1.1"
svgc.attributes["xmlns"] = "http://www.w3.org/2000/svg"

#transform/translate to screen space coord system
def trans(coord)
	return [coord[0]+600, -coord[1]+350]
end
draw_line(svgc, [600,0],[600,700],[200,200,200])
draw_line(svgc, [0,350],[1200,350],[200,200,200])

i = 0
for p in pairs
	a1 = [-600, p[0]*(-600) + p[1]]
	a2 = [600, p[0]*600 + p[1]]
	#too lazy handle this the right way
	if p[0] > 50
		a1 = [-50, p[0]*(-50) + p[1]]
		a2 = [50, p[0]*50 + p[1]]
	elsif p[0] > 20
		a1 = [-100, p[0]*(-100) + p[1]]
		a2 = [100, p[0]*100 + p[1]]
	end
	i += 1
	#best new colour algorithm ever!!!!
	draw_line(svgc, trans(a1), trans(a2), 
	[(i * 302) % 256,(i * 337) % 256,(i * 377) % 256])
end

File.open("Nikolay_Dionisov.svg", "w") do |f|
	f.write(doc.to_s)
end