require 'rexml/document'

def createline(svg)
	r = Random.new
	line = svg.add_element "polyline"
	line.attributes["style"] = "fill:white;stroke:rgb(#{r.rand(0..255)},#{r.rand(0..255)},#{r.rand(0..255)});stroke-width:3"
	line.attributes["points"] = ""
	return line
end

def addpoint(line, x, y)
	line.attributes["points"] << " #{x+600},#{y+350}"
end

def snaptogrid(line, arg)
	[-300, 300].each do |x|
		y = arg[0]*x + arg[1]
		addpoint(line, x, y) if y.between?(-300,300)
	end

	return if arg[0] == 0

	[-300, 300].each do |y|
		x = (y - arg[1])/arg[0]
		addpoint(line, x, y) if x.between?(-300,300)
	end
end

unless ARGV.length.odd? || ARGV.length < 2
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

	args = []
	ARGV.each_slice(2) {|a| args << [a[0].to_i, a[1].to_i] }
	args.each do |arg|
		line = createline(el_svg)
		snaptogrid(line, arg)
	end

	File.open("Presian_Abarov.svg", "w") do |f|
		f.write(doc.to_s)
	end

else
	print "arguments are not right\n"
end