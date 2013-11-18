require 'rexml/document'



def createline(svg)
	r = Random.new
	line = svg.add_element "polyline"
	line.attributes["style"] = "fill:white;stroke:rgb(#{r.rand(0..255)},#{r.rand(0..255)},#{r.rand(0..255)});stroke-width:3"
	line.attributes["points"] = ""
	return line
end

def addpoint(line, x, y)
        line.attributes["points"] << " #{x+600},#{350-y}"
end

def y(x, a, b, c)
	return (a*x*x + b*x + c)
end


a = -1; b = 0; c = 0

doc = REXML::Document.new
el_svg = doc.add_element "svg"
el_svg.attributes["version"] = "1.1"
el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"

grid = []
0.upto(1) do |i|
	grid << createline(el_svg)
	grid[i].attributes["style"] = "fill:white;stroke:black;stroke-width:1"
end

addpoint(grid[0], -300, 0)
addpoint(grid[0], 300, 0)
addpoint(grid[1], 0, -300)
addpoint(grid[1], 0, 300)

quad = createline(el_svg)

-300.upto(300) do |x|
	addpoint(quad, x, y(x, a, b, c+20))
end

File.open("Presian_Abarov.svg", "w") do |f|
    f.write(doc.to_s)
end