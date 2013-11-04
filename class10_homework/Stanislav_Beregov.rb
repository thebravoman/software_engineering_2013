require 'rexml/document'

def y(a, x, b)
	return a*x+b
end

def line(parent, x, y, w, h, r, g, b)
	ln =parent.add_element "line"
	ln.attributes["x1"] = x
	ln.attributes["y1"] = y
	ln.attributes["x2"] = w
	ln.attributes["y2"] = h
	ln.attributes["stroke"] = "rgb(#{r},#{g},#{b})"
	ln.attributes["stroke-width"] = "2"
end

doc = REXML::Document.new
svg = doc.add_element "svg"
svg.attributes["version"]="1.1"
svg.attributes["xmlns"]="http://www.w3.org/2000/svg"
g = svg.add_element "g"
g.attributes["transform"] = "translate(600,350)"
line(g, -300, 0, 300, 0, 0, 0, 0)
line(g, 0, -300, 0, 300, 0, 0, 0)
i = 0

ARGV.each_slice(2) do |args|
	ln_y = y(args[0].to_i, i, args[1].to_i)
	line(g, i, ln_y-100, i, ln_y, ((255.0/ARGV.size.to_f/5)*i).to_i, ((255.0/ARGV.size.to_f/5)*i).to_i, ((255.0/ARGV.size.to_f/5)*i).to_i)
	i += 5
end

File.open("Stanislav_Beregov.svg",'w') do |svg|
	svg.write(doc.to_s)
end
