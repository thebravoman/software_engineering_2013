require 'rexml/document'

def line(doc, x2, y2)
	the_line = doc.add_element "line"
	the_line.attributes["x1"] = "600"
	the_line.attributes["y1"] = "350"
	the_line.attributes["x2"] = x2
	the_line.attributes["y2"] = y2
	y2 = y2.to_i
	x2 = x2.to_i
	while (x2 > 255)
		x2 = x2/2
	end
	while (y2 > 255)
		y2 = y2/2
	end
	the_line.attributes["stroke"] = "rgb(#{x2},#{x2},#{y2})"

end

doc = REXML::Document.new
svg = doc.add_element "svg"
svg.attributes["version"] = "1.1"
svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"

sys_x = svg.add_element "line"
sys_x.attributes["x1"] = "0"
sys_x.attributes["y1"] = "350"
sys_x.attributes["x2"] = "3000"
sys_x.attributes["y2"] = "350"
sys_x.attributes["stroke"] = "black"

sys_y = svg.add_element "line"
sys_y.attributes["x1"] = "600"
sys_y.attributes["y1"] = "0"
sys_y.attributes["x2"] = "600"
sys_y.attributes["y2"] = "3000"
sys_y.attributes["stroke"] = "black"

i = 0;

while (ARGV[i] != nil)
	line(svg, ARGV[i].to_i + 600, ((ARGV[i + 1].to_i) * -1) + 350)
	i = i + 2;
end

File.open("Victor_Slavov.svg", "w") do |file|
	file << doc.to_s
end

























