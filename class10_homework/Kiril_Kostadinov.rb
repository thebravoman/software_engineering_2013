require 'rexml/document'

def black_line(doc, x1, y1, x2, y2)
	line = doc.add_element "line"
	line.attributes["x1"] = x1
	line.attributes["y1"] = y1
	line.attributes["x2"] = x2
	line.attributes["y2"] = y2
	line.attributes["style"] = "stroke:black;stroke-width:4"
end

def draw_coord_sys(doc, x, y)
	black_line(doc, x-300, y, x+300, y)
	black_line(doc, x, y-300, x, y+300)
	#Drawing arrows for badassery
	black_line(doc, x+300, y, x+280, y-20)
	black_line(doc, x+300, y, x+280, y+20)
	black_line(doc, x, y-300, x-20, y-280)
	black_line(doc, x, y-300, x+20, y-280)
end

def line(doc, x1, y1, x2, y2)
	line = doc.add_element "line"
	line.attributes["x1"] = x1
	line.attributes["y1"] = y1
	line.attributes["x2"] = x2
	line.attributes["y2"] = y2
	line.attributes["style"] = "stroke:rgb(#{rand(255)},#{rand(255)},#{rand(255)});stroke-width:3"
end

#Origin coordinates can be changed easily
ORIGIN_X = 600
ORIGIN_Y = 350

if ARGV.length < 2
	puts "Error: Not enough arguments given."
elsif ARGV.length % 2 != 0
	puts "Error: Odd number of argumnets given."
else
	svg = REXML::Document.new
	el_svg = svg.add_element "svg"
	el_svg.attributes["xmlns"] = "http://www.w3.org/2000/svg"
	el_svg.attributes["version"] = "1.1"
	draw_coord_sys(el_svg, ORIGIN_X, ORIGIN_Y)

	for i in 0..ARGV.length - 1
		next if i % 2 != 0 
		x1 = -300
		x2 = 300
		y1 = ARGV[i].to_i * x1 + ARGV[i + 1].to_i
		y2 = ARGV[i].to_i * x2 + ARGV[i + 1].to_i
		line(el_svg, ORIGIN_X + x1, ORIGIN_Y - y1, ORIGIN_X + x2, ORIGIN_Y - y2)
	end

	File.open("Kiril_Kostadinov.svg", "w") do |out|
		out << svg
	end
end
